import 'package:boobook/config.dart';
import 'package:boobook/core/models/book.dart';
import 'package:boobook/presentation/routes/navigators.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/providers/common.dart';
import 'package:boobook/repositories/book_repository.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This provider reads the stream from the database to get the list of the books.
final bookListProvider = StreamProvider<List<Book>>((ref) {
  final repository = ref.watch(bookRepositoryProvider);
  return repository.booksStream();
});

/// The selected [Book] id
/// It must be overridden in a [ProviderScope] before being used.
final selectedBookId = Provider<String>((_) => throw UnimplementedError());

/// A provider that returns the selected [Book] from its id.
/// The list is fetched with a !, which usually can lead to some fatal
/// error but in this case, the list has already been fetched in the previous
/// page so it can't lead to a fatal error here.
final bookProvider = Provider.autoDispose.family<Book, String>((ref, id) {
  final bookList = ref.watch(bookListProvider).asData!.value;
  return bookList.where((book) => book.id == id).first;
});

final magazineProvider = Provider.autoDispose<String?>((_) => null);

/// A provider that needs to be scoped with the callback that
/// will be used when the user selects a book in the list.
final bookHandler = Provider<Function(Book)>(
  (ref) => ((Book book) {
    final navigator = NavigatorKeys.books.currentState!;
    navigator.pushNamed(AppRoutes.bookDetailsPage(book.id!));
  }),
);

final bookRefProvider = Provider<CollectionReference<Book>>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);

  // We are not supposed to call this provider in a part of the app
  // where the [UserRepository] is null, so this exception should
  // never be thrown.
  if (userRepository == null) {
    throw Exception("This provider should not be invoked here.");
  }

  // The reference of the books subcollection
  return userRepository.ref<Book>(
    FirestorePath.books,
    fromFirestore: (snapshot, _) {
      final bookFromJson = Book.fromJson(snapshot.data()!);
      return bookFromJson.copyWith(id: snapshot.id);
    },
    toFirestore: (book, _) {
      return book.toJson()
        ..remove("id")
        ..remove("isFromISBNdb")
        ..remove("isNewBook")
        ..remove("userId");
    },
  );
});

final bookLibraryRefProvider = Provider<CollectionReference<Book>>((ref) {
  final userId = ref.watch(userProvider.select((user) => user!.id));

  if (userId == null) {
    throw Exception("This provider should not be invoked here.");
  }

  // The reference of the books subcollection
  return FirebaseFirestore.instance
      .collection(FirestorePath.books)
      .withConverter<Book>(
    fromFirestore: (snapshot, _) {
      final bookFromJson = Book.fromJson(snapshot.data()!);
      return bookFromJson.copyWith(id: snapshot.id);
    },
    toFirestore: (book, _) {
      return book.copyWith(userId: userId).toJson()
        ..remove("id")
        ..remove("isFromISBNdb")
        ..remove("isFromUnknownISBN")
        ..remove("isNewBook");
    },
  );
});
