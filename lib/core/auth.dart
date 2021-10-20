import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initializing() = _Initializing;
  const factory AuthState.notAuthed() = _NotAuthed;
  const factory AuthState.fetchingUser() = _Fetching;
  const factory AuthState.waitingUserCreation() = _WaitingUserCreation;
  const factory AuthState.authed() = _Authed;
  const factory AuthState.error(String error) = _Error;
}
