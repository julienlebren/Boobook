import 'package:boobook/core/models/user.dart';
import 'package:boobook/repositories/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_service/firebase_auth_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firestore_service/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository?>((ref) {
  final service = ref.watch(firestoreServiceProvider);
  final userId = ref.watch(
    authServiceProvider.select((service) => service.currentUser?.uid),
  );
  if (userId == null) {
    return null;
  } else {
    return UserRepository(service, userId);
  }
});

class UserRepository {
  UserRepository(this.service, this.userId);

  final FirestoreService service;
  final String userId;

  final _userRef = FirebaseFirestore.instance
      .collection(FirestorePath.users)
      .withConverter<User>(
        fromFirestore: (snapshot, _) {
          final userFromJson = User.fromJson(snapshot.data()!);
          return userFromJson.copyWith(id: snapshot.id);
        },
        toFirestore: (user, _) => user.toJson()..remove('id'),
      );

  CollectionReference<T> ref<T>(
    String path, {
    required FromFirestore<T> fromFirestore,
    required ToFirestore<T> toFirestore,
  }) {
    return _userRef.doc(userId).collection(path).withConverter<T>(
          fromFirestore: fromFirestore,
          toFirestore: toFirestore,
        );
  }

  Reference storageRef(String path) => FirebaseStorage.instance
      .ref()
      .child("${StoragePath.users}/$userId")
      .child(path);

  Stream<User?> streamUser() {
    return _userRef.doc(userId).snapshots().map((snapshot) => snapshot.data());
  }

  Future<void> set(User user) => _userRef.doc(user.id).set(user);
}
