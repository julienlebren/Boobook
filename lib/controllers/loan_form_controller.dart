import 'package:boobook/core/models/book.dart';
import 'package:boobook/core/models/loan.dart';
import 'package:boobook/core/models/pupil.dart';
import 'package:boobook/repositories/loan_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_form_controller.freezed.dart';

@freezed
class LoanFormEvent with _$LoanFormEvent {
  const factory LoanFormEvent.bookChanged(Book book) = _BookChanged;
  const factory LoanFormEvent.pupilChanged(Pupil pupil) = _PupilChanged;
  const factory LoanFormEvent.loanDateChanged(DateTime date) = _LoanDateChanged;
  const factory LoanFormEvent.expectedReturnDateChanged(DateTime date) =
      _ExpectedReturnDateChanged;
  const factory LoanFormEvent.save() = _Save;
}

@freezed
class LoanFormState with _$LoanFormState {
  const factory LoanFormState({
    required Loan loan,
    @Default(false) bool canSubmit,
    @Default(false) bool isSaving,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _LoanFormState;

  factory LoanFormState.initial(Loan loan) => LoanFormState(loan: loan);
}

class LoanFormController extends StateNotifier<LoanFormState> {
  LoanFormController(
    this._repository,
    Loan loan,
  ) : super(LoanFormState.initial(loan)) {
    _checkIfCanSubmit();
  }

  final LoanRepository _repository;

  void handleEvent(LoanFormEvent event) {
    event.when(
      bookChanged: (book) {
        state = state.copyWith.loan(book: book);
        _checkIfCanSubmit();
      },
      pupilChanged: (pupil) {
        state = state.copyWith.loan(pupil: pupil);
        _checkIfCanSubmit();
      },
      loanDateChanged: (date) {
        state = state.copyWith.loan(loanDate: date);
        _checkIfCanSubmit();
      },
      expectedReturnDateChanged: (date) {
        state = state.copyWith.loan(expectedReturnDate: date);
        _checkIfCanSubmit();
      },
      save: () => _saveLoan(),
    );
  }

  void _checkIfCanSubmit() {
    bool canSubmit = true;

    if (state.loan.pupil == null) {
      state = state.copyWith(
        canSubmit: false,
      );
    } else if (canSubmit != state.canSubmit) {
      state = state.copyWith(
        errorText: null,
        canSubmit: canSubmit,
      );
    }
  }

  Future<void> _saveLoan() async {
    state = state.copyWith(isSaving: true);

    try {
      await _repository.set(state.loan);
      state = state.copyWith(isSuccess: true);
    } catch (e) {
      state = state.copyWith(errorText: e.toString());
    }
  }
}
