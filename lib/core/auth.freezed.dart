// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _Initializing initializing() {
    return const _Initializing();
  }

  _NotAuthed notAuthed() {
    return const _NotAuthed();
  }

  _Fetching fetchingUser() {
    return const _Fetching();
  }

  _WaitingUserCreation waitingUserCreation() {
    return const _WaitingUserCreation();
  }

  _Authed authed() {
    return const _Authed();
  }

  _Error error(String error) {
    return _Error(
      error,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() fetchingUser,
    required TResult Function() waitingUserCreation,
    required TResult Function() authed,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initializing value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_Fetching value) fetchingUser,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$InitializingCopyWith<$Res> {
  factory _$InitializingCopyWith(
          _Initializing value, $Res Function(_Initializing) then) =
      __$InitializingCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitializingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$InitializingCopyWith<$Res> {
  __$InitializingCopyWithImpl(
      _Initializing _value, $Res Function(_Initializing) _then)
      : super(_value, (v) => _then(v as _Initializing));

  @override
  _Initializing get _value => super._value as _Initializing;
}

/// @nodoc

class _$_Initializing implements _Initializing {
  const _$_Initializing();

  @override
  String toString() {
    return 'AuthState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initializing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() fetchingUser,
    required TResult Function() waitingUserCreation,
    required TResult Function() authed,
    required TResult Function(String error) error,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
  }) {
    return initializing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initializing value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_Fetching value) fetchingUser,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_Error value) error,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
  }) {
    return initializing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class _Initializing implements AuthState {
  const factory _Initializing() = _$_Initializing;
}

/// @nodoc
abstract class _$NotAuthedCopyWith<$Res> {
  factory _$NotAuthedCopyWith(
          _NotAuthed value, $Res Function(_NotAuthed) then) =
      __$NotAuthedCopyWithImpl<$Res>;
}

/// @nodoc
class __$NotAuthedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$NotAuthedCopyWith<$Res> {
  __$NotAuthedCopyWithImpl(_NotAuthed _value, $Res Function(_NotAuthed) _then)
      : super(_value, (v) => _then(v as _NotAuthed));

  @override
  _NotAuthed get _value => super._value as _NotAuthed;
}

/// @nodoc

class _$_NotAuthed implements _NotAuthed {
  const _$_NotAuthed();

  @override
  String toString() {
    return 'AuthState.notAuthed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NotAuthed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() fetchingUser,
    required TResult Function() waitingUserCreation,
    required TResult Function() authed,
    required TResult Function(String error) error,
  }) {
    return notAuthed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
  }) {
    return notAuthed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (notAuthed != null) {
      return notAuthed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initializing value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_Fetching value) fetchingUser,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_Error value) error,
  }) {
    return notAuthed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
  }) {
    return notAuthed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (notAuthed != null) {
      return notAuthed(this);
    }
    return orElse();
  }
}

abstract class _NotAuthed implements AuthState {
  const factory _NotAuthed() = _$_NotAuthed;
}

/// @nodoc
abstract class _$FetchingCopyWith<$Res> {
  factory _$FetchingCopyWith(_Fetching value, $Res Function(_Fetching) then) =
      __$FetchingCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$FetchingCopyWith<$Res> {
  __$FetchingCopyWithImpl(_Fetching _value, $Res Function(_Fetching) _then)
      : super(_value, (v) => _then(v as _Fetching));

  @override
  _Fetching get _value => super._value as _Fetching;
}

/// @nodoc

class _$_Fetching implements _Fetching {
  const _$_Fetching();

  @override
  String toString() {
    return 'AuthState.fetchingUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Fetching);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() fetchingUser,
    required TResult Function() waitingUserCreation,
    required TResult Function() authed,
    required TResult Function(String error) error,
  }) {
    return fetchingUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
  }) {
    return fetchingUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (fetchingUser != null) {
      return fetchingUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initializing value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_Fetching value) fetchingUser,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_Error value) error,
  }) {
    return fetchingUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
  }) {
    return fetchingUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (fetchingUser != null) {
      return fetchingUser(this);
    }
    return orElse();
  }
}

abstract class _Fetching implements AuthState {
  const factory _Fetching() = _$_Fetching;
}

/// @nodoc
abstract class _$WaitingUserCreationCopyWith<$Res> {
  factory _$WaitingUserCreationCopyWith(_WaitingUserCreation value,
          $Res Function(_WaitingUserCreation) then) =
      __$WaitingUserCreationCopyWithImpl<$Res>;
}

/// @nodoc
class __$WaitingUserCreationCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$WaitingUserCreationCopyWith<$Res> {
  __$WaitingUserCreationCopyWithImpl(
      _WaitingUserCreation _value, $Res Function(_WaitingUserCreation) _then)
      : super(_value, (v) => _then(v as _WaitingUserCreation));

  @override
  _WaitingUserCreation get _value => super._value as _WaitingUserCreation;
}

/// @nodoc

class _$_WaitingUserCreation implements _WaitingUserCreation {
  const _$_WaitingUserCreation();

  @override
  String toString() {
    return 'AuthState.waitingUserCreation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _WaitingUserCreation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() fetchingUser,
    required TResult Function() waitingUserCreation,
    required TResult Function() authed,
    required TResult Function(String error) error,
  }) {
    return waitingUserCreation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
  }) {
    return waitingUserCreation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (waitingUserCreation != null) {
      return waitingUserCreation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initializing value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_Fetching value) fetchingUser,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_Error value) error,
  }) {
    return waitingUserCreation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
  }) {
    return waitingUserCreation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (waitingUserCreation != null) {
      return waitingUserCreation(this);
    }
    return orElse();
  }
}

abstract class _WaitingUserCreation implements AuthState {
  const factory _WaitingUserCreation() = _$_WaitingUserCreation;
}

/// @nodoc
abstract class _$AuthedCopyWith<$Res> {
  factory _$AuthedCopyWith(_Authed value, $Res Function(_Authed) then) =
      __$AuthedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AuthedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthedCopyWith<$Res> {
  __$AuthedCopyWithImpl(_Authed _value, $Res Function(_Authed) _then)
      : super(_value, (v) => _then(v as _Authed));

  @override
  _Authed get _value => super._value as _Authed;
}

/// @nodoc

class _$_Authed implements _Authed {
  const _$_Authed();

  @override
  String toString() {
    return 'AuthState.authed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Authed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() fetchingUser,
    required TResult Function() waitingUserCreation,
    required TResult Function() authed,
    required TResult Function(String error) error,
  }) {
    return authed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
  }) {
    return authed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (authed != null) {
      return authed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initializing value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_Fetching value) fetchingUser,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_Error value) error,
  }) {
    return authed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
  }) {
    return authed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (authed != null) {
      return authed(this);
    }
    return orElse();
  }
}

abstract class _Authed implements AuthState {
  const factory _Authed() = _$_Authed;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function() notAuthed,
    required TResult Function() fetchingUser,
    required TResult Function() waitingUserCreation,
    required TResult Function() authed,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function()? notAuthed,
    TResult Function()? fetchingUser,
    TResult Function()? waitingUserCreation,
    TResult Function()? authed,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initializing value) initializing,
    required TResult Function(_NotAuthed value) notAuthed,
    required TResult Function(_Fetching value) fetchingUser,
    required TResult Function(_WaitingUserCreation value) waitingUserCreation,
    required TResult Function(_Authed value) authed,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initializing value)? initializing,
    TResult Function(_NotAuthed value)? notAuthed,
    TResult Function(_Fetching value)? fetchingUser,
    TResult Function(_WaitingUserCreation value)? waitingUserCreation,
    TResult Function(_Authed value)? authed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(String error) = _$_Error;

  String get error;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
