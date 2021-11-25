import 'package:boobook/core/models/loan.dart';
import 'package:boobook/repositories/loan_repository.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:boobook/repositories/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This provider reads the stream from the database to get the list of the loans.
final loanListProvider = StreamProvider.autoDispose<List<Loan>>((ref) {
  final repository = ref.watch(loanRepositoryProvider);
  return repository.loansStream();
});

final loanProvider = Provider.autoDispose<Loan>(
  (_) => throw UnimplementedError(),
);

final loanRefProvider = Provider<CollectionReference<Loan>>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);

  // We are not supposed to call this provider in a part of the app
  // where the [UserRepository] is null, so this exception should
  // never be thrown.
  if (userRepository == null) {
    throw Exception("This provider should not be invoked here.");
  }

  // The reference of the pupils subcollection
  return userRepository.ref<Loan>(
    FirestorePath.loans,
    fromFirestore: (snapshot, _) {
      final loanFromJson = Loan.fromJson(snapshot.data()!);
      return loanFromJson.copyWith(id: snapshot.id);
    },
    toFirestore: (loan, _) {
      final book = loan.book!.toJson()
        ..remove("authors")
        ..remove("isArchived")
        ..remove("isAvailable")
        ..remove("isFromISBNdb")
        ..remove("isbn")
        ..remove("pages")
        ..remove("totalLoans");

      final pupil = loan.pupil!.toJson()
        ..remove("currentLoans")
        ..remove("isArchived")
        ..remove("totalLoans")
        ..remove("pages")
        ..remove("totalLoans");

      return loan.toJson()
        ..remove("id")
        ..remove("isNewLoan")
        ..remove("book")
        ..remove("pupil")
        ..addEntries([
          MapEntry("book", book),
          MapEntry("pupil", pupil),
        ]);
    },
  );
});
