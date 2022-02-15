import 'package:boobook/controllers/loan_form_controller.dart';
import 'package:boobook/models/book.dart';
import 'package:boobook/models/loan.dart';
import 'package:boobook/models/pupil.dart';
import 'package:boobook/presentation/common_widgets/book_tile.dart';
import 'package:boobook/presentation/views/home/books/book_list_page.dart';
import 'package:boobook/presentation/views/home/loans/loan_list_page.dart';
import 'package:boobook/common_providers.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/presentation/views/home/pupils/pupil_list_page.dart';
import 'package:boobook/presentation/views/home/scan/scan_page.dart';
import 'package:boobook/repositories/loan_repository.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/layout_builder.dart';

enum LoanMode { add, edit }

final selectedLoanId = Provider<String>((ref) => throw UnimplementedError());

final loanControllerProvider = StateNotifierProvider.family
    .autoDispose<LoanFormController, LoanFormState, String>((ref, id) {
  final repository = ref.watch(loanRepositoryProvider);

  final loanList = ref.read(loanListProvider).asData!.value;
  final filteredList = loanList.where((pupil) => pupil.id == id);

  if (filteredList.isEmpty) {
    // Because we are dismissing the modal sheet in the [ScanPage] when we push this form,
    // `pupil` and `book` are resetted from the [ScanController], so if we use `ref.watch` below,
    // we are also losing `pupil` and `book` in the form. To fix this, we use `ref.read` to only
    // get  `pupil` and `book` once, when the form is loaded.
    final scanController = ref.read(scanControllerProvider);
    final book = scanController.book;
    final pupil = scanController.pupil;

    return LoanFormController(
      repository,
      Loan.create(
        id: id,
        pupil: pupil,
        book: book,
      ),
    );
  } else {
    return LoanFormController(
      repository,
      filteredList.first,
    );
  }
});

final loanModeProvider = Provider<LoanMode>((_) => LoanMode.edit);

class LoanFormNavigator extends ConsumerWidget {
  const LoanFormNavigator({Key? key}) : super(key: key);

  void _onBookSelected(WidgetRef ref, Book book) {
    _handleEvent(ref, LoanFormEvent.bookChanged(book));
    final navigator = AppRouter.loan.currentState!;
    navigator.pushNamed(
      AppRouter.pupilListPage,
      arguments: PupilPageArguments(
        onPupilChanged: (pupil) => _onPupilSelected(ref, pupil),
        isPicker: true,
        isFullScreenRoute: false,
      ),
    );
  }

  void _onPupilSelected(WidgetRef ref, Pupil pupil) {
    _handleEvent(ref, LoanFormEvent.pupilChanged(pupil));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(selectedLoanId);
    final book = ref.watch(
      loanControllerProvider(id).select((state) => state.loan.book),
    );
    final pupil = ref.watch(
      loanControllerProvider(id).select((state) => state.loan.pupil),
    );

    ref.listen<LoanFormState>(loanControllerProvider(id), (_, state) {
      final l10n = ref.watch(localizationProvider);

      if (state.isSuccess) {
        final navigator = AppRouter.main.currentState!;
        navigator.pop(context);
      } else if (state.loan.book != null && state.loan.pupil != null) {
        final navigator = AppRouter.loan.currentState!;
        navigator.pushNamedAndRemoveUntil(
          AppRouter.loanFormPage(id),
          (Route<dynamic> route) => false,
        );
      } else if (state.errorText != null) {
        showErrorDialog(
          context,
          ref,
          title: l10n.errorTitle,
          content: state.errorText,
        );
      }
    });

    return ProviderScope(
      overrides: [
        bookHandler.overrideWithValue((book) => _onBookSelected(ref, book)),
        pupilHandler.overrideWithValue((pupil) => _onPupilSelected(ref, pupil)),
      ],
      child: Navigator(
        key: AppRouter.loan,
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings, ref),
        initialRoute: (() {
          if (book == null) {
            return AppRouter.bookListPage;
          } else if (pupil == null) {
            return AppRouter.pupilListPage;
          } else {
            return AppRouter.loanFormPage(id);
          }
        }()),
      ),
    );
  }
}

void _handleEvent(WidgetRef ref, LoanFormEvent event) {
  final id = ref.watch(selectedLoanId);
  final controller = ref.read(loanControllerProvider(id).notifier);
  controller.handleEvent(event);
}

class LoanFormPage extends ConsumerWidget {
  const LoanFormPage({Key? key}) : super(key: key);

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
    final isNewLoan = ref.watch(
      loanControllerProvider(id).select((state) => state.loan.isNewLoan),
    );

    if (isNewLoan != true) {
      ref.listen<LoanFormState>(loanControllerProvider(id), (_, state) {
        final l10n = ref.watch(localizationProvider);

        if (state.isSuccess) {
          final navigator = AppRouter.loans.currentState!;
          navigator.pop(context);
        } else if (state.errorText != null) {
          showErrorDialog(
            context,
            ref,
            title: l10n.errorTitle,
            content: state.errorText,
          );
        }
      });
    }

    return PlatformScaffold(
      appBar: PlatformNavigationBar(
        title: isNewLoan == true ? l10n.loanNewTitle : l10n.loanDetailsTitle,
        leading: isNewLoan == true
            ? PlatformNavigationBarCloseButton(
                onPressed: () {
                  final navigator = AppRouter.main.currentState!;
                  navigator.pop();
                },
              )
            : null,
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

    if (book != null) {
      return FormSection(
        child: ProviderScope(
          overrides: [
            bookAvailableProvider.overrideWithValue(false),
            selectedBookId.overrideWithValue(book.id!),
          ],
          child: const BookTile(),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
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
    final navigator = AppRouter.main.currentState!;
    navigator.pushNamed(
      AppRouter.pupilListPage,
      arguments: PupilPageArguments(
        pupilId: state.loan.pupil?.id,
        onPupilChanged: _onPupilChanged,
        isPicker: true,
        isFullScreenRoute: true,
      ),
    );
  }

  void _onPupilChanged(Pupil pupil) {
    _handleEvent(ref, LoanFormEvent.pupilChanged(pupil));
    final navigator = AppRouter.main.currentState!;
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
