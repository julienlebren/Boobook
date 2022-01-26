import 'package:boobook/config.dart';
import 'package:boobook/core/models/pupil.dart';
import 'package:boobook/presentation/routes/navigators.dart';
import 'package:boobook/presentation/routes/router.dart';
import 'package:boobook/repositories/pupil_repository.dart';
import 'package:boobook/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This provider reads the stream from the database to get the list of the pupils.
final pupilListProvider = StreamProvider<List<Pupil>>((ref) {
  final repository = ref.watch(pupilRepositoryProvider);
  return repository.pupilsStream();
});

final selectedPupilId = Provider<String?>((ref) => null);

/// A provider that needs to be scoped with the callback that
/// will be used when the user selects a pupil in the list.
final pupilHandler = Provider<Function(Pupil)>(
  (ref) => ((Pupil pupil) {
    final navigator = NavigatorKeys.pupils.currentState!;
    navigator.pushNamed(AppRoutes.pupilDetailsPage(pupil.id!));
  }),
);

final pupilRefProvider = Provider<CollectionReference<Pupil>>((ref) {
  final userRepository = ref.watch(userRepositoryProvider);

  // We are not supposed to call this provider in a part of the app
  // where the [UserRepository] is null, so this exception should
  // never be thrown.
  if (userRepository == null) {
    throw Exception("This provider should not be invoked here.");
  }

  // The reference of the pupils subcollection
  return userRepository.ref<Pupil>(
    FirestorePath.pupils,
    fromFirestore: (snapshot, _) {
      final pupilFromJson = Pupil.fromJson(snapshot.data()!);
      return pupilFromJson.copyWith(id: snapshot.id);
    },
    toFirestore: (pupil, _) {
      return pupil.toJson()
        ..remove("id")
        ..remove("isNewPupil");
    },
  );
});
