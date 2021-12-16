import 'package:avatar/avatar.dart';
import 'package:boobook/controllers/pupil_form_controller.dart';
import 'package:boobook/core/models/pupil.dart';
import 'package:boobook/providers/common.dart';
import 'package:boobook/providers/pupils.dart';
import 'package:boobook/repositories/pupil_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';
import 'package:photo_upload/upload.dart';

final pupilControllerProvider = StateNotifierProvider.family
    .autoDispose<PupilFormController, PupilFormState, String>((ref, id) {
  final repository = ref.watch(pupilRepositoryProvider);
  final pupilList = ref.read(pupilListProvider).asData!.value;
  final filteredList = pupilList.where((pupil) => pupil.id == id);

  if (filteredList.isEmpty) {
    return PupilFormController(repository, Pupil.create(id: id));
  } else {
    return PupilFormController(repository, filteredList.first);
  }
});

void _handleEvent(WidgetRef ref, PupilFormEvent event) {
  final id = ref.watch(selectedPupilId)!;
  final controller = ref.read(pupilControllerProvider(id).notifier);
  controller.handleEvent(event);
}

class PupilFormPage extends ConsumerWidget {
  const PupilFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedPupilId)!;

    ref.listen<PupilFormState>(pupilControllerProvider(id), (_, state) {
      final l10n = ref.watch(localizationProvider);
      if (state.isSuccess) {
        Navigator.pop(context);
      } else if (state.errorText != null) {
        showErrorDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: state.errorText,
        );
      }
    });

    return const PupilFormPageBuilder();
  }
}

class PupilFormPageBuilder extends ConsumerWidget {
  const PupilFormPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final id = ref.watch(selectedPupilId)!;
    final canSubmit = ref.watch(
      pupilControllerProvider(id).select((state) => state.canSubmit),
    );
    final isSaving = ref.watch(
      pupilControllerProvider(id).select((state) => state.isSaving),
    );
    final isNewPupil = ref.watch(
      pupilControllerProvider(id).select((state) => state.pupil.isNewPupil),
    );

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        leading: PlatformNavigationBarCloseButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: isNewPupil == true ? l10n.pupilNewTitle : l10n.pupilEditTitle,
        trailing: PupilFormSubmitButton(
          isSaving: isSaving,
          canSubmit: canSubmit,
        ),
      ),
      body: FormWithOverlay(
        isSaving: isSaving,
        child: const PupilFormContents(),
      ),
    );
  }
}

class PupilFormSubmitButton extends ConsumerWidget {
  const PupilFormSubmitButton({
    Key? key,
    required this.canSubmit,
    required this.isSaving,
  }) : super(key: key);

  _savePupil(WidgetRef ref) {
    _handleEvent(ref, PupilFormEvent.save());
  }

  final bool isSaving;
  final bool canSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isSaving) {
      return FormLoader();
    } else {
      return PlatformNavigationBarSaveButton(
        onPressed: canSubmit ? () => _savePupil(ref) : null,
      );
    }
  }
}

class PupilFormContents extends ConsumerWidget {
  const PupilFormContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormPage(
      children: [
        const PupilFormAvatarSection(),
        const PupilFormGeneralSection(),
      ],
    );
  }
}

class PupilFormAvatarSection extends ConsumerWidget {
  const PupilFormAvatarSection({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final id = ref.watch(selectedPupilId)!;
    final pupil = ref.watch(pupilControllerProvider(id)).pupil;
    final repository = ref.watch(pupilRepositoryProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isMaterial() ? 15 : 0),
      child: UploadWidget(
        width: 120,
        height: 120,
        title: l10n.pupilPhoto,
        storageRef: repository.storageRef(pupil.id!),
        showDeleteButton: pupil.photoUrl != null,
        onDelete: () => _handleEvent(ref, PupilFormEvent.deletePhoto()),
        onStart: () {},
        onSuccess: (url) =>
            _handleEvent(ref, PupilFormEvent.photoUploaded(url)),
        maxWidth: 1000,
        child: Avatar(
          name: pupil.displayName,
          color: pupil.color,
          url: pupil.photoUrl,
          radius: 60,
        ),
      ),
    );
  }
}

class PupilFormGeneralSection extends ConsumerStatefulWidget {
  const PupilFormGeneralSection({Key? key}) : super(key: key);

  @override
  _PupilFormGeneralSectionState createState() =>
      _PupilFormGeneralSectionState();
}

class _PupilFormGeneralSectionState
    extends ConsumerState<PupilFormGeneralSection> {
  final lastNameFocusNode = FocusNode();
  final firstNameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(localizationProvider);
    final id = ref.watch(selectedPupilId)!;
    final pupil = ref.read(pupilControllerProvider(id)).pupil;

    return FormSection(
      children: [
        FormRow(
          child: PlatformTextField(
            controller: TextEditingController(text: pupil.lastName),
            textInputAction: TextInputAction.next,
            placeholder: l10n.lastName,
            autocorrect: false,
            textCapitalization: TextCapitalization.words,
            onSubmitted: (_) => firstNameFocusNode.requestFocus(),
            onChanged: (String value) {
              _handleEvent(ref, PupilFormEvent.lastNameChanged(value));
            },
          ),
        ),
        FormRow(
          child: PlatformTextField(
            controller: TextEditingController(text: pupil.firstName),
            focusNode: firstNameFocusNode,
            textInputAction: TextInputAction.done,
            placeholder: l10n.firstName,
            autocorrect: false,
            textCapitalization: TextCapitalization.words,
            onChanged: (String value) {
              _handleEvent(ref, PupilFormEvent.firstNameChanged(value));
            },
          ),
        ),
      ],
    );
  }
}
