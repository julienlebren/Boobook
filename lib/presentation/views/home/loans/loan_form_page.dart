import 'package:boobook/controllers/loan_form_controller.dart';
import 'package:boobook/core/models/loan.dart';
import 'package:boobook/core/models/pupil.dart';
import 'package:boobook/presentation/common_widgets/book_tile.dart';
import 'package:boobook/providers/books.dart';
import 'package:boobook/providers/common.dart';
import 'package:boobook/presentation/routes/navigators.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/presentation/views/home/pupils/pupil_list_page.dart';
import 'package:boobook/presentation/views/home/scan/scan_page.dart';
import 'package:boobook/providers/loans.dart';
import 'package:boobook/repositories/loan_repository.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';

final selectedLoanId = Provider<String?>((ref) => null);

final loanControllerProvider = StateNotifierProvider.family
    .autoDispose<LoanFormController, LoanFormState, String?>((ref, id) {
  final repository = ref.watch(loanRepositoryProvider);
  if (id == null) {
    final scanController = ref.watch(scanControllerProvider);
    final loan = Loan(
      isNewLoan: true,
      book: scanController.book!,
      pupil: scanController.pupil,
      loanDate: DateTime.now(),
      expectedReturnDate: DateTime.now().add(const Duration(days: 14)),
    );
    return LoanFormController(repository, loan);
  } else {
    final loanList = ref.read(loanListProvider).asData!.value;
    final loan = loanList.where((loan) => loan.id == id).first;
    return LoanFormController(repository, loan);
  }
});

void _handleEvent(WidgetRef ref, LoanFormEvent event) {
  final id = ref.watch(selectedLoanId);
  final controller = ref.read(loanControllerProvider(id).notifier);
  controller.handleEvent(event);
}

class LoanFormPage extends ConsumerWidget {
  const LoanFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedLoanId);

    ref.listen<LoanFormState>(loanControllerProvider(id), (_, state) {
      final l10n = ref.watch(localizationProvider);
      if (state.isSuccess) {
        Navigator.pop(context);
      } else if (state.errorText != null) {
        showAlertDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: state.errorText,
        );
      }
    });

    return const LoanFormPageBuilder();
  }
}

class LoanFormPageBuilder extends ConsumerWidget {
  const LoanFormPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(localizationProvider);
    final id = ref.watch(selectedLoanId);
    final isSaving = ref.watch(
      loanControllerProvider(id).select((state) => state.isSaving),
    );
    final canSubmit = ref.watch(
      loanControllerProvider(id).select((state) => state.canSubmit),
    );

    return PlatformModalScaffold(
      appBar: PlatformNavigationBar(
        title: id == null ? l10n.loanNewTitle : l10n.loanDetailsTitle,
        trailing: LoanFormSubmitButton(
          isSaving: isSaving,
          canSubmit: canSubmit,
        ),
      ),
      body: FormWithOverlay(
        isSaving: isSaving,
        child: const LoanFormContents(),
      ),
    );
  }
}

class LoanFormSubmitButton extends ConsumerWidget {
  const LoanFormSubmitButton({
    Key? key,
    required this.canSubmit,
    required this.isSaving,
  }) : super(key: key);

  _saveLoan(WidgetRef ref) {
    _handleEvent(ref, LoanFormEvent.save());
  }

  final bool isSaving;
  final bool canSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isSaving) {
      return FormLoader();
    } else {
      return PlatformNavigationBarSaveButton(
        onPressed: canSubmit ? () => _saveLoan(ref) : null,
      );
    }
  }
}

class LoanFormContents extends StatelessWidget {
  const LoanFormContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormPage(
      children: [
        const LoanFormBookSection(),
        const LoanFormGeneralSection(),
      ],
    );
  }
}

class LoanFormBookSection extends ConsumerWidget {
  const LoanFormBookSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedLoanId);
    final book = ref.watch(
      loanControllerProvider(id).select((controller) => controller.loan.book),
    );

    return FormSection(
      child: ProviderScope(
        overrides: [
          bookAvailableProvider.overrideWithValue(false),
          selectedBookId.overrideWithValue(book!.id),
        ],
        child: const BookTile(),
      ),
    );
  }
}

class LoanFormGeneralSection extends ConsumerStatefulWidget {
  const LoanFormGeneralSection({Key? key}) : super(key: key);

  @override
  _LoanFormGeneralSectionState createState() => _LoanFormGeneralSectionState();
}

class _LoanFormGeneralSectionState
    extends ConsumerState<LoanFormGeneralSection> {
  void _openPupils(BuildContext context) {
    final id = ref.watch(selectedLoanId);
    final state = ref.read(loanControllerProvider(id));
    final navigator = NavigatorKeys.main.currentState!;
    navigator.pushNamed(
      AppRoutes.pupilListPage,
      arguments: PupilPageArguments(state.loan.pupil?.id, _onPupilChanged),
    );
  }

  void _onPupilChanged(Pupil pupil) {
    _handleEvent(ref, LoanFormEvent.pupilChanged(pupil));
    final navigator = NavigatorKeys.main.currentState!;
    navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = ref.watch(localizationProvider);
    final id = ref.watch(selectedLoanId);
    final controller = ref.watch(loanControllerProvider(id));
    final firstDate = DateTime.now().subtract(Duration(days: 365));
    final lastDate = DateTime.now().add(Duration(days: 365));

    return FormSection(
      children: [
        FormTappableField(
          label: l10n.loanBorrower,
          value: controller.loan.pupil?.displayName,
          onPressed: () => _openPupils(context),
        ),
        FormTappableField(
          label: l10n.loanDate,
          value: controller.loan.loanDate.toLocaleDate(context),
          onPressed: () => showPlatformDatePicker(
            context,
            ref,
            initialDate: controller.loan.loanDate,
            firstDate: firstDate,
            lastDate: lastDate,
            onChanged: (value) => _handleEvent(
              ref,
              LoanFormEvent.loanDateChanged(value),
            ),
          ),
        ),
        FormTappableField(
          label: l10n.loanExpectedReturn,
          value: controller.loan.expectedReturnDate.toLocaleDate(context),
          onPressed: () => showPlatformDatePicker(
            context,
            ref,
            initialDate: controller.loan.expectedReturnDate,
            firstDate: firstDate,
            lastDate: lastDate,
            onChanged: (value) => _handleEvent(
              ref,
              LoanFormEvent.expectedReturnDateChanged(value),
            ),
          ),
        ),
      ],
    );
  }
}
