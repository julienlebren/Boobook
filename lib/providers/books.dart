import 'package:boobook/core/models/book.dart';
import 'package:boobook/core/models/loan.dart';
import 'package:boobook/repositories/book_repository.dart';
import 'package:boobook/repositories/loan_repository.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:boobook/repositories/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This provider reads the stream from the database to get the list of the books.
final bookListProvider = StreamProvider.autoDispose<List<Book>>((ref) {
  final repository = ref.watch(bookRepositoryProvider);
  return repository.booksStream();
});

/// The selected [Book] id
/// It must be overridden in a [ProviderScope] before being used.
final selectedBookId = Provider<String?>((_) => null);

/// A provider that returns the selected [Book] from its id.
/// The list is fetched with a !, which usually can lead to some fatal
/// error but in this case, the list has already been fetched in the previous
/// page so it can't lead to a fatal error here.
final bookProvider = Provider.autoDispose.family<Book, String>((ref, id) {
  final bookList = ref.watch(bookListProvider).asData!.value;
  return bookList.where((book) => book.id == id).first;
});

final bookLoansProvider =
    FutureProvider.family.autoDispose<List<Loan>, String>((ref, bookId) {
  final repository = ref.watch(loanRepositoryProvider);
  return repository.bookLoans(bookId);
});

final bookRefProvider = Provider<CollectionReference<Book>>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);

  // We are not supposed to call this provider in a part of the app
  // where the [UserRepository] is null, so this exception should
  // never be thrown.
  if (userRepository == null) {
    throw Exception("This provider should not be invoked here.");
  }

  // The reference of the pupils subcollection
  return userRepository.ref<Book>(
    FirestorePath.books,
    fromFirestore: (snapshot, _) {
      final bookFromJson = Book.fromJson(snapshot.data()!);
      return bookFromJson.copyWith(id: snapshot.id);
    },
    toFirestore: (book, _) {
      return book.toJson()
        ..remove("id")
        ..remove("isFromISBNdb");
    },
  );
});
