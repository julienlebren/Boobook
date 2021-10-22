import 'dart:io';
import 'package:boobook/core/models/pupil.dart';
import 'package:boobook/providers/pupils.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:boobook/repositories/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firestore_service/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The provider for accessing the [PupilRepository]
///
/// It depends on the [UserRepository] because in this app database,
/// the "pupils" collection is a sub-collection of the collection "users".
final pupilRepositoryProvider = Provider.autoDispose<PupilRepository>((ref) {
  final userRepository = ref.read(userRepositoryProvider);

  // We are not supposed to call this provider in a part of the app
  // where the [UserRepository] is null, so this exception should
  // never be thrown.
  if (userRepository == null) {
    throw Exception("This provider should not be invoked here.");
  }

  // The reference of the pupils subcollection
  final pupilRef = ref.watch(pupilRefProvider);

  // The storage reference for uploading pupils pictures
  final pupilStorageRef = userRepository.storageRef(StoragePath.pupils);

  // Firestore service
  final service = ref.watch(firestoreServiceProvider);

  return PupilRepository(service, pupilRef, pupilStorageRef);
});

class PupilRepository {
  PupilRepository(
    this._service,
    this._pupilRef,
    this._pupilStorageRef,
  );

  final FirestoreService _service;
  final CollectionReference<Pupil> _pupilRef;
  final Reference _pupilStorageRef;

  String get newDocumentId => _service.newDocumentId(_pupilRef.path);

  Stream<List<Pupil>> pupilsStream() {
    return _service.streamDocuments(
      _pupilRef.where('isArchived', isEqualTo: false),
    );
  }

  Future<Pupil?> get(String id) async =>
      _service.getDocument<Pupil>(_pupilRef.doc(id));

  Future<void> add(Pupil pupil) => _pupilRef.add(pupil);

  Future<void> set(Pupil pupil) => _pupilRef.doc(pupil.id).set(pupil);

  Future<void> delete(Pupil pupil) => _pupilRef.doc(pupil.id).delete();

  Reference storageRef(String id) => _pupilStorageRef.child(id);

  UploadTask uploadPhoto(File file) => _pupilStorageRef.putFile(file);

  Future<void> deletePhoto(String id) => _pupilStorageRef.child(id).delete();
}
