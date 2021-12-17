import 'package:boobook/core/models/book.dart';
import 'package:boobook/core/models/loan.dart';
import 'package:boobook/core/models/pupil.dart';
import 'package:boobook/repositories/book_repository.dart';
import 'package:boobook/repositories/loan_repository.dart';
import 'package:boobook/repositories/pupil_repository.dart';
import 'package:checkdigit/checkdigit.dart';
import 'package:dio/dio.dart';
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
  const factory ScanEvent.errorDismissed() = _ErrorDismissed;
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
    @Default(false) bool isISBN,
    @Default(false) bool isPupil,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool isSuccess,
    @Default(false) bool maxLoansReached,
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
              state.isUnknownCode ||
              state.book != null && barCode.code!.length != 20) {
            /*(state.book != null && !state.book!.isAvailable) ||
              (state.book != null && barCode.code == state.book!.isbn13) ||
              (state.book != null &&
                  state.isUnknownPupil &&
                  barCode.code == state.barCode!.code) ||
              (state.book != null && state.pupil != null)) {*/
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
      errorDismissed: () {
        state = state.copyWith(
          pupil: null,
          maxLoansReached: false,
          errorText: null,
          isUnknownCode: false,
        );
      },
      addBook: () => _addBook(),
      returnLoan: () => _returnLoan(),
      pupilSelected: (pupil) => _pupilSelected(pupil),
    );
  }

  void _searchCode(Barcode barCode) async {
    if (barCode.code!.length == 20) {
      _searchMemberId(barCode);
    } else if (barCode.code!.length == 13 &&
        (barCode.code!.startsWith("978") || barCode.code!.startsWith("979")) &&
        isbn13.validate(barCode.code!)) {
      _searchISBN(barCode);
    } else {
      print("Code is ${barCode.code}");
      state = state.copyWith(
        isUnknownCode: true,
      );
    }
  }

  void _setLoading(Barcode barCode) {
    state = state.copyWith(
      isLoading: true,
      barCode: barCode,
      errorText: null,
      isISBN: false,
      isUnknownPupil: false,
      maxLoansReached: false,
    );
  }

  void _searchISBN(Barcode barCode) async {
    _setLoading(barCode);

    Book? book;

    try {
      Loan? loan = await loanRepository.findBook(barCode.code!);

      if (loan == null) {
        final books = await bookRepository.findBook(barCode.code!);

        if (books.isEmpty) {
          final books = await bookRepository.findBookInLibrary(barCode.code!);

          if (books.isNotEmpty) {
            book = books.first;
          } else {
            final _book = await isbnDb.getBook(barCode.code!);

            if (_book != null) {
              book = Book.fromISBNdb(_book, id: bookRepository.newDocumentId);
            }
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
    } on DioError catch (_) {
      state = state.copyWith(
        isISBN: true,
        isLoading: false,
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
    _setLoading(barCode);

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
      pupil: pupil,
      maxLoansReached: pupil.currentLoans >= maxSimultaneousLoans,
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

  bool isValidISBN(String isbn13) {
    final isbn = isbn13.substring(3, 13);
    final n = isbn.length;
    if (n != 10) return false;

    int sum = 0;
    for (int i = 0; i < 9; i++) {
      int digit = int.parse(isbn[i]);
      if (0 > digit || 9 < digit) return false;
      sum += (digit * (10 - i));
    }

    final last = isbn[9];
    if (last != 'X' && (int.parse(last) < 0 || int.parse(last) > 9)) {
      return false;
    }

    sum += ((last == 'X') ? 10 : int.parse(last));

    return (sum % 11 == 0);
  }
}
