import 'package:boobook/core/models/book.dart';
import 'package:boobook/core/models/loan.dart';
import 'package:boobook/core/models/pupil.dart';
import 'package:boobook/providers/books.dart';
import 'package:boobook/providers/loans.dart';
import 'package:boobook/providers/pupils.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_service/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loanRepositoryProvider = Provider<LoanRepository>((ref) {
  final userRepository = ref.read(userRepositoryProvider);

  // We are not supposed to call this provider in a part of the app
  // where the [UserRepository] is null, so this exception should
  // never be thrown.
  if (userRepository == null) {
    throw Exception("This provider should not be invoked here.");
  }

  // The reference of the pupils subcollection
  final bookRef = ref.watch(bookRefProvider);
  final pupilRef = ref.watch(pupilRefProvider);
  final loanRef = ref.watch(loanRefProvider);

  // Firestore service
  final service = ref.watch(firestoreServiceProvider);

  return LoanRepository(service, loanRef, bookRef, pupilRef);
});

class LoanRepository {
  LoanRepository(
    this._service,
    this._loanRef,
    this._bookRef,
    this._pupilRef,
  );

  final FirestoreService _service;
  final CollectionReference<Loan> _loanRef;
  final CollectionReference<Book> _bookRef;
  final CollectionReference<Pupil> _pupilRef;

  Stream<List<Loan>> loansStream() {
    return _service.streamDocuments(
      _loanRef.where("returnDate", isNull: true),
    );
  }

  Stream<List<Loan>> bookLoans(String bookId) {
    return _service.streamDocuments(
      _loanRef
          .where("book.id", isEqualTo: bookId)
          .orderBy("loanDate", descending: true),
    );
  }

  Stream<List<Loan>> pupilLoans(String pupilId) {
    return _service.streamDocuments(
      _loanRef
          .where("pupil.id", isEqualTo: pupilId)
          .orderBy("loanDate", descending: true),
    );
  }

  Future<Loan?> findBook(String isbn) async {
    final loans = await _service.getDocuments<Loan>(_loanRef
        .where('book.isbn13', isEqualTo: isbn)
        .where('returnDate', isNull: true));

    if (loans.isNotEmpty) {
      return loans.first;
    }
  }

  Future<void> set(Loan loan) async {
    final book = loan.book;
    final pupil = loan.pupil;

    if (book == null || pupil == null) {
      return;
    }

    final batch = _service.batch();

    batch.set(_loanRef.doc(loan.id), loan);

    if (loan.isNewLoan ?? false) {
      batch.update(_bookRef.doc(book.id), {
        "isAvailable": false,
        "totalLoans": FieldValue.increment(1),
      });

      batch.update(
        _pupilRef.doc(pupil.id),
        {
          "currentLoans": FieldValue.increment(1),
          "totalLoans": FieldValue.increment(1),
        },
      );
    } else {
      if (loan.isLost) {
        batch.update(_bookRef.doc(book.id), {
          "isArchived": true,
        });
      } else {
        batch.update(_bookRef.doc(book.id), {
          "isAvailable": true,
        });
      }

      batch.update(
        _pupilRef.doc(pupil.id),
        {
          "currentLoans": FieldValue.increment(-1),
        },
      );
    }

    batch.commit();
  }

  Future<void> delete(Loan loan) async {
    final book = loan.book;
    final pupil = loan.pupil;

    if (book == null || pupil == null) {
      return;
    }

    final batch = _service.batch();

    batch.delete(_loanRef.doc(loan.id));

    batch.update(_bookRef.doc(book.id), {
      "isAvailable": true,
    });

    batch.update(
      _pupilRef.doc(pupil.id),
      {
        "currentLoans": FieldValue.increment(-1),
        "totalLoans": FieldValue.increment(-1),
      },
    );

    batch.commit();
  }
}
