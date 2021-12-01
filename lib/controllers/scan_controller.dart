import 'package:boobook/core/models/book.dart';
import 'package:boobook/core/models/loan.dart';
import 'package:boobook/core/models/pupil.dart';
import 'package:boobook/repositories/book_repository.dart';
import 'package:boobook/repositories/loan_repository.dart';
import 'package:boobook/repositories/pupil_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isbndb/isbndb.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'scan_controller.freezed.dart';

enum BookStatus { unknownBook, book }

@freezed
class ScanEvent with _$ScanEvent {
  const factory ScanEvent.controllerCreated(QRViewController controller) =
      _ControllerCreated;
  const factory ScanEvent.toggleFlash() = _ToggleFlash;
  const factory ScanEvent.addBook() = _AddBook;
  const factory ScanEvent.returnLoan() = _ReturnLoan;
  const factory ScanEvent.pupilSelected(Pupil pupil) = _PupilSelected;
  const factory ScanEvent.modalDismissed() = _ModalDismissed;
}

@freezed
class ScanState with _$ScanState {
  const factory ScanState({
    QRViewController? controller,
    Barcode? barCode,
    Loan? loan,
    Book? book,
    Pupil? pupil,
    @Default(false) bool isUnknownCode,
    @Default(false) bool isUnknownPupil,
    @Default(false) bool maxLoansReached,
    @Default(false) bool isISBN,
    @Default(false) bool isPupil,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _ScanState;
}

class ScanController extends StateNotifier<ScanState> {
  ScanController(
    this.loanRepository,
    this.bookRepository,
    this.pupilRepository,
    this.isbnDb,
    this.maxSimultaneousLoans,
  ) : super(ScanState());

  LoanRepository loanRepository;
  BookRepository bookRepository;
  PupilRepository pupilRepository;
  ISBNdb isbnDb;
  int maxSimultaneousLoans;

  void handleEvent(ScanEvent event) {
    event.when(
      controllerCreated: (controller) {
        controller.scannedDataStream.listen((barCode) async {
          if (state.isSuccess ||
              state.isLoading ||
              (state.book != null && !state.book!.isAvailable) ||
              (state.book != null && barCode.code == state.book!.isbn13) ||
              (state.book != null &&
                  state.isUnknownPupil &&
                  barCode.code == state.barCode!.code) ||
              (state.book != null && state.pupil != null)) {
            return;
          }
          _searchCode(barCode);
        });
        state = state.copyWith(controller: controller);
      },
      toggleFlash: () {
        state.controller!.toggleFlash();
      },
      modalDismissed: () {
        Future.delayed(
          const Duration(milliseconds: 300),
          () => state = ScanState(controller: state.controller),
        );
      },
      addBook: () => _addBook(),
      returnLoan: () => _returnLoan(),
      pupilSelected: (pupil) => _pupilSelected(pupil),
    );
  }

  void _searchCode(Barcode barCode) async {
    state = state.copyWith(
      isLoading: true,
      barCode: barCode,
      errorText: null,
    );

    switch (barCode.code!.length) {
      case 13:
        _searchISBN(barCode);
        break;
      case 20:
        _searchMemberId(barCode);
        break;
      default:
        state = state.copyWith(
          isLoading: false,
          isUnknownCode: true,
        );
    }
  }

  void _searchISBN(Barcode barCode) async {
    Book? book;

    try {
      Loan? loan = await loanRepository.findBook(barCode.code!);

      if (loan == null) {
        final books = await bookRepository.findBook(barCode.code!);

        if (books.isEmpty) {
          final _book = await isbnDb.getBook(barCode.code!);

          throw UnimplementedError(
              "This is a test error message, you should not see this in production mode.");

          if (_book != null) {
            book = Book.fromISBNdb(_book, id: bookRepository.newDocumentId);
          }
        } else {
          book = books.first;
        }
      } else {
        book = loan.book!.copyWith(isAvailable: false);
      }

      state = state.copyWith(
        isISBN: true,
        isLoading: false,
        book: book,
        loan: loan,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        barCode: null,
        errorText: e.toString(),
      );
    }
  }

  void _searchMemberId(Barcode barCode) async {
    state = state.copyWith(
      isISBN: false,
      isLoading: true,
      maxLoansReached: false,
      isUnknownPupil: false,
    );

    try {
      final pupil = await pupilRepository.get(barCode.code!);

      if (pupil == null) {
        state = state.copyWith(
          isLoading: false,
          isUnknownPupil: true,
        );
      } else {
        _pupilSelected(pupil);
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        barCode: null,
        errorText: e.toString(),
      );
    }
  }

  void _pupilSelected(Pupil pupil) {
    state = state.copyWith(
      isISBN: false,
      isPupil: true,
      isLoading: false,
      maxLoansReached: (pupil.currentLoans >= maxSimultaneousLoans),
      pupil: pupil,
    );
  }

  void _addBook() {
    if (state.book == null) return;

    state = state.copyWith(
      isSaving: true,
      isISBN: false,
    );

    try {
      bookRepository.add(state.book!);
      state = state.copyWith(
        barCode: null,
        isSaving: false,
        isSuccess: true,
      );
    } catch (e) {
      state = state.copyWith(
        isSaving: false,
        errorText: e.toString(),
      );
    }
  }

  void _returnLoan() {
    if (state.loan == null) return;

    state = state.copyWith(
      isSaving: true,
      isISBN: false,
    );

    try {
      loanRepository.set(state.loan!.copyWith(returnDate: DateTime.now()));
      state = state.copyWith(
        barCode: null,
        isSaving: false,
        isSuccess: true,
      );
    } catch (e) {
      state = state.copyWith(
        isSaving: false,
        errorText: e.toString(),
      );
    }
  }
}
