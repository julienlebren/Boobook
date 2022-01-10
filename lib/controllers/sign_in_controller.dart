import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_service/firebase_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_controller.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;
  const factory SignInState.loading() = _Loading;
  const factory SignInState.error(String errorText) = _Error;
}

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.signInWithFacebook() = _Facebook;
  const factory SignInEvent.signInWithGoogle() = _Google;
  const factory SignInEvent.signInWithApple() = _Apple;
  const factory SignInEvent.signInAnonymously() = _Anonymously;
}

class SignInController extends StateNotifier<SignInState> {
  SignInController(this._service) : super(SignInState.initial());

  final FirebaseAuthService _service;

  Future<void> handleEvent(SignInEvent event) async {
    state = SignInState.loading();
    try {
      await event.when(
        signInWithApple: _service.signInWithApple,
        signInWithFacebook: _service.signInWithFacebook,
        signInWithGoogle: _service.signInWithGoogle,
        signInAnonymously: _service.signInAnonymously,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "ERROR_AUTHORIZATION_DENIED") {
        state = SignInState.initial();
      } else if (e.code != "ERROR_ABORTED_BY_USER") {
        state = SignInState.error(e.toString());
      } else {
        state = SignInState.initial();
      }
    } on Exception catch (e) {
      state = SignInState.error(e.toString());
    }
  }

  Future<void> signOut() async {
    _service.signOut();
  }
}
