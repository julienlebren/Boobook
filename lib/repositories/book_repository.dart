import 'package:boobook/core/models/book.dart';
import 'package:boobook/providers/books.dart';
import 'package:boobook/repositories/helpers.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firestore_service/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The provider for accessing the [BookRepository]
///
/// It depends on the [BookRepository] because in this app database,
/// the "books" collection is a sub-collection of the collection "users".
final bookRepositoryProvider = Provider<BookRepository>((ref) {
  final userRepository = ref.read(userRepositoryProvider);

  // We are not supposed to call this provider in a part of the app
  // where the [UserRepository] is null, so this exception should
  // never be thrown.
  if (userRepository == null) {
    throw Exception("This provider should not be invoked here.");
  }

  // The reference of the pupils subcollection
  final bookRef = ref.watch(bookRefProvider);

  // The storage reference for uploading book covers
  final bookStorageRef = userRepository.storageRef(StoragePath.books);

  // Firestore service
  final service = ref.watch(firestoreServiceProvider);

  return BookRepository(service, bookRef, bookStorageRef);
});

class BookRepository {
  BookRepository(
    this._service,
    this._bookRef,
    this._bookStorageRef,
  );

  final FirestoreService _service;
  final CollectionReference<Book> _bookRef;
  final Reference _bookStorageRef;

  String get newDocumentId => _service.newDocumentId(_bookRef.path);

  Stream<List<Book>> booksStream() {
    return _service.streamDocuments(
      _bookRef.where('isArchived', isEqualTo: false),
    );
  }

  Future<List<Book>> findBook(String isbn) async {
    return _service.getDocuments<Book>(_bookRef
        .where('isArchived', isEqualTo: false)
        .where('isbn13', isEqualTo: isbn));
  }

  Future<void> add(Book book) => _bookRef.add(book);

  Future<void> set(Book book) => _bookRef.doc(book.id).set(book);

  Future<void> delete(Book book) => _bookRef.doc(book.id).delete();

  Reference storageRef(String id) => _bookStorageRef.child(id);

  Future<void> deleteImage(String id) => _bookStorageRef.child(id).delete();
}
