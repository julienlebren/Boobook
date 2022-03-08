import 'package:boobook/config.dart';
import 'package:boobook/models/book.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firestore_service/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookRefProvider = Provider<CollectionReference<Book>>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);

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
  final userRepository = ref.watch(userRepositoryProvider);

  if (userRepository == null) {
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
      return book.copyWith(userId: userRepository.userId).toJson()
        ..remove("id")
        ..remove("isFromISBNdb")
        ..remove("isFromUnknownISBN")
        ..remove("isNewBook");
    },
  );
});

/// The provider for accessing the [BookRepository]
///
/// It depends on the [BookRepository] because in this app database,
/// the "books" collection is a sub-collection of the collection "users".
final bookRepositoryProvider = Provider<BookRepository>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);

  // We are not supposed to call this provider in a part of the app
  // where the [UserRepository] is null, so this exception should
  // never be thrown.
  if (userRepository == null) {
    throw Exception("This provider should not be invoked here.");
  }

  // The reference of the books subcollection
  final bookRef = ref.watch(bookRefProvider);

  // The reference of the books top collection
  final bookLibraryRef = ref.watch(bookLibraryRefProvider);

  // The storage reference for uploading book covers
  final bookStorageRef = userRepository.storageRef(StoragePath.books);

  // Firestore service
  final service = ref.watch(firestoreServiceProvider);

  return BookRepository(service, bookRef, bookLibraryRef, bookStorageRef);
});

class BookRepository {
  BookRepository(
    this._service,
    this._bookRef,
    this._bookLibraryRef,
    this._bookStorageRef,
  );

  final FirestoreService _service;
  final CollectionReference<Book> _bookRef;
  final CollectionReference<Book> _bookLibraryRef;
  final Reference _bookStorageRef;
  final _cache = <String, Book>{};

  String get newDocumentId => _service.newDocumentId(_bookRef.path);

  Stream<List<Book>> booksStream() {
    return _service.streamDocuments(
      _bookRef.where('isArchived', isEqualTo: false),
    );
  }

  Book? bookFromCache(String id) {
    if (_cache.containsKey(id)) {
      return _cache[id]!;
    }
    return null;
  }

  Future<Book?> getBook(String id) async {
    if (_cache.containsKey(id)) {
      return _cache[id]!;
    }
    final book = await _service.getDocument<Book>(_bookRef.doc(id));
    if (book != null) {
      _cache[book.id!] = book;
      return book;
    }
    return null;
  }

  Future<List<Book>> findMagazines(String magazineBarCode) async {
    return _service.getDocuments<Book>(_bookRef
        .where('isArchived', isEqualTo: false)
        .where('magazineBarCode', isEqualTo: magazineBarCode));
  }

  Future<List<Book>> findBook(String isbn) async {
    final books = await _service.getDocuments<Book>(_bookRef
        .where('isArchived', isEqualTo: false)
        .where('isbn13', isEqualTo: isbn));

    for (final book in books) {
      _cache[book.id!] = book;
    }
    return books;
  }

  Future<List<Book>> findBookInLibrary(String isbn) async {
    return _service
        .getDocuments<Book>(_bookLibraryRef.where('isbn13', isEqualTo: isbn));
  }

  Future<void> add(Book book) => _bookRef.add(book);

  Future<void> set(Book book) async {
    await _bookRef.doc(book.id).set(book);
    if (book.isFromUnknownISBN) {
      await _bookLibraryRef.doc(book.id).set(book);
    }
  }

  Future<void> delete(Book book) => _bookRef.doc(book.id).delete();

  Reference storageRef(String id) => _bookStorageRef.child(id);

  Reference storageLibraryRef(String id) =>
      FirebaseStorage.instance.ref().child(StoragePath.books).child(id);

  Future<void> deleteImage(String id) => _bookStorageRef.child(id).delete();
}
