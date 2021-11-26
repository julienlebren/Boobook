import 'package:boobook/core/models/pupil.dart';
import 'package:boobook/repositories/pupil_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pupil_form_controller.freezed.dart';

@freezed
class PupilFormState with _$PupilFormState {
  const factory PupilFormState({
    required Pupil pupil,
    @Default(false) bool canSubmit,
    @Default(false) bool isSaving,
    @Default(false) bool isSuccess,
    String? errorText,
  }) = _PupilFormState;

  factory PupilFormState.initial(Pupil pupil) => PupilFormState(pupil: pupil);
}

@freezed
class PupilFormEvent with _$PupilFormEvent {
  const factory PupilFormEvent.deletePhoto() = _DeletePhoto;
  const factory PupilFormEvent.photoUploaded(String photoURL) = _PhotoUploaded;
  const factory PupilFormEvent.firstNameChanged(String firstName) =
      _FirstNameChanged;
  const factory PupilFormEvent.lastNameChanged(String lastName) =
      _LastNameChanged;
  const factory PupilFormEvent.save() = _Save;
}

class PupilFormController extends StateNotifier<PupilFormState> {
  PupilFormController(
    this._repository,
    Pupil pupil,
  ) : super(PupilFormState.initial(pupil));

  final PupilRepository _repository;

  void handleEvent(PupilFormEvent event) {
    event.when(
      lastNameChanged: (lastName) {
        state = state.copyWith.pupil(lastName: lastName);
        _checkIfCanSubmit();
      },
      firstNameChanged: (firstName) {
        state = state.copyWith.pupil(firstName: firstName);
        _checkIfCanSubmit();
      },
      deletePhoto: () {
        _repository.deletePhoto(state.pupil.id!);
        state = state.copyWith.pupil(photoUrl: null);
        _checkIfCanSubmit();
      },
      photoUploaded: (photoUrl) {
        state = state.copyWith.pupil(photoUrl: photoUrl);
        _checkIfCanSubmit();
      },
      save: () {
        savePupil();
      },
    );
  }

  void _checkIfCanSubmit() {
    bool canSubmit =
        state.pupil.lastName.length > 1 && state.pupil.firstName.length > 1;

    if (canSubmit != state.canSubmit) {
      state = state.copyWith(
        errorText: null,
        canSubmit: canSubmit,
      );
    }
  }

  Future<void> savePupil() async {
    if (!state.canSubmit) return;
    state = state.copyWith(isSaving: true);

    try {
      await _repository.set(state.pupil);
      state = state.copyWith(isSuccess: true);
    } catch (e) {
      state = state.copyWith(errorText: e.toString());
    }
  }
}
