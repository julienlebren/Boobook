// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pupil_form_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PupilFormStateTearOff {
  const _$PupilFormStateTearOff();

  _PupilFormState call(
      {required Pupil pupil,
      bool canSubmit = false,
      bool isSaving = false,
      bool isSuccess = false,
      String? errorText}) {
    return _PupilFormState(
      pupil: pupil,
      canSubmit: canSubmit,
      isSaving: isSaving,
      isSuccess: isSuccess,
      errorText: errorText,
    );
  }
}

/// @nodoc
const $PupilFormState = _$PupilFormStateTearOff();

/// @nodoc
mixin _$PupilFormState {
  Pupil get pupil => throw _privateConstructorUsedError;
  bool get canSubmit => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PupilFormStateCopyWith<PupilFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PupilFormStateCopyWith<$Res> {
  factory $PupilFormStateCopyWith(
          PupilFormState value, $Res Function(PupilFormState) then) =
      _$PupilFormStateCopyWithImpl<$Res>;
  $Res call(
      {Pupil pupil,
      bool canSubmit,
      bool isSaving,
      bool isSuccess,
      String? errorText});

  $PupilCopyWith<$Res> get pupil;
}

/// @nodoc
class _$PupilFormStateCopyWithImpl<$Res>
    implements $PupilFormStateCopyWith<$Res> {
  _$PupilFormStateCopyWithImpl(this._value, this._then);

  final PupilFormState _value;
  // ignore: unused_field
  final $Res Function(PupilFormState) _then;

  @override
  $Res call({
    Object? pupil = freezed,
    Object? canSubmit = freezed,
    Object? isSaving = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      pupil: pupil == freezed
          ? _value.pupil
          : pupil // ignore: cast_nullable_to_non_nullable
              as Pupil,
      canSubmit: canSubmit == freezed
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $PupilCopyWith<$Res> get pupil {
    return $PupilCopyWith<$Res>(_value.pupil, (value) {
      return _then(_value.copyWith(pupil: value));
    });
  }
}

/// @nodoc
abstract class _$PupilFormStateCopyWith<$Res>
    implements $PupilFormStateCopyWith<$Res> {
  factory _$PupilFormStateCopyWith(
          _PupilFormState value, $Res Function(_PupilFormState) then) =
      __$PupilFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Pupil pupil,
      bool canSubmit,
      bool isSaving,
      bool isSuccess,
      String? errorText});

  @override
  $PupilCopyWith<$Res> get pupil;
}

/// @nodoc
class __$PupilFormStateCopyWithImpl<$Res>
    extends _$PupilFormStateCopyWithImpl<$Res>
    implements _$PupilFormStateCopyWith<$Res> {
  __$PupilFormStateCopyWithImpl(
      _PupilFormState _value, $Res Function(_PupilFormState) _then)
      : super(_value, (v) => _then(v as _PupilFormState));

  @override
  _PupilFormState get _value => super._value as _PupilFormState;

  @override
  $Res call({
    Object? pupil = freezed,
    Object? canSubmit = freezed,
    Object? isSaving = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_PupilFormState(
      pupil: pupil == freezed
          ? _value.pupil
          : pupil // ignore: cast_nullable_to_non_nullable
              as Pupil,
      canSubmit: canSubmit == freezed
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PupilFormState implements _PupilFormState {
  const _$_PupilFormState(
      {required this.pupil,
      this.canSubmit = false,
      this.isSaving = false,
      this.isSuccess = false,
      this.errorText});

  @override
  final Pupil pupil;
  @JsonKey(defaultValue: false)
  @override
  final bool canSubmit;
  @JsonKey(defaultValue: false)
  @override
  final bool isSaving;
  @JsonKey(defaultValue: false)
  @override
  final bool isSuccess;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'PupilFormState(pupil: $pupil, canSubmit: $canSubmit, isSaving: $isSaving, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PupilFormState &&
            (identical(other.pupil, pupil) || other.pupil == pupil) &&
            (identical(other.canSubmit, canSubmit) ||
                other.canSubmit == canSubmit) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, pupil, canSubmit, isSaving, isSuccess, errorText);

  @JsonKey(ignore: true)
  @override
  _$PupilFormStateCopyWith<_PupilFormState> get copyWith =>
      __$PupilFormStateCopyWithImpl<_PupilFormState>(this, _$identity);
}

abstract class _PupilFormState implements PupilFormState {
  const factory _PupilFormState(
      {required Pupil pupil,
      bool canSubmit,
      bool isSaving,
      bool isSuccess,
      String? errorText}) = _$_PupilFormState;

  @override
  Pupil get pupil;
  @override
  bool get canSubmit;
  @override
  bool get isSaving;
  @override
  bool get isSuccess;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$PupilFormStateCopyWith<_PupilFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$PupilFormEventTearOff {
  const _$PupilFormEventTearOff();

  _DeletePhoto deletePhoto() {
    return const _DeletePhoto();
  }

  _PhotoUploaded photoUploaded(String photoURL) {
    return _PhotoUploaded(
      photoURL,
    );
  }

  _FirstNameChanged firstNameChanged(String firstName) {
    return _FirstNameChanged(
      firstName,
    );
  }

  _LastNameChanged lastNameChanged(String lastName) {
    return _LastNameChanged(
      lastName,
    );
  }

  _Save save() {
    return const _Save();
  }
}

/// @nodoc
const $PupilFormEvent = _$PupilFormEventTearOff();

/// @nodoc
mixin _$PupilFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deletePhoto,
    required TResult Function(String photoURL) photoUploaded,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function() save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_PhotoUploaded value) photoUploaded,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_Save value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PupilFormEventCopyWith<$Res> {
  factory $PupilFormEventCopyWith(
          PupilFormEvent value, $Res Function(PupilFormEvent) then) =
      _$PupilFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PupilFormEventCopyWithImpl<$Res>
    implements $PupilFormEventCopyWith<$Res> {
  _$PupilFormEventCopyWithImpl(this._value, this._then);

  final PupilFormEvent _value;
  // ignore: unused_field
  final $Res Function(PupilFormEvent) _then;
}

/// @nodoc
abstract class _$DeletePhotoCopyWith<$Res> {
  factory _$DeletePhotoCopyWith(
          _DeletePhoto value, $Res Function(_DeletePhoto) then) =
      __$DeletePhotoCopyWithImpl<$Res>;
}

/// @nodoc
class __$DeletePhotoCopyWithImpl<$Res>
    extends _$PupilFormEventCopyWithImpl<$Res>
    implements _$DeletePhotoCopyWith<$Res> {
  __$DeletePhotoCopyWithImpl(
      _DeletePhoto _value, $Res Function(_DeletePhoto) _then)
      : super(_value, (v) => _then(v as _DeletePhoto));

  @override
  _DeletePhoto get _value => super._value as _DeletePhoto;
}

/// @nodoc

class _$_DeletePhoto implements _DeletePhoto {
  const _$_DeletePhoto();

  @override
  String toString() {
    return 'PupilFormEvent.deletePhoto()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DeletePhoto);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deletePhoto,
    required TResult Function(String photoURL) photoUploaded,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function() save,
  }) {
    return deletePhoto();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
  }) {
    return deletePhoto?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (deletePhoto != null) {
      return deletePhoto();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_PhotoUploaded value) photoUploaded,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_Save value) save,
  }) {
    return deletePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
  }) {
    return deletePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (deletePhoto != null) {
      return deletePhoto(this);
    }
    return orElse();
  }
}

abstract class _DeletePhoto implements PupilFormEvent {
  const factory _DeletePhoto() = _$_DeletePhoto;
}

/// @nodoc
abstract class _$PhotoUploadedCopyWith<$Res> {
  factory _$PhotoUploadedCopyWith(
          _PhotoUploaded value, $Res Function(_PhotoUploaded) then) =
      __$PhotoUploadedCopyWithImpl<$Res>;
  $Res call({String photoURL});
}

/// @nodoc
class __$PhotoUploadedCopyWithImpl<$Res>
    extends _$PupilFormEventCopyWithImpl<$Res>
    implements _$PhotoUploadedCopyWith<$Res> {
  __$PhotoUploadedCopyWithImpl(
      _PhotoUploaded _value, $Res Function(_PhotoUploaded) _then)
      : super(_value, (v) => _then(v as _PhotoUploaded));

  @override
  _PhotoUploaded get _value => super._value as _PhotoUploaded;

  @override
  $Res call({
    Object? photoURL = freezed,
  }) {
    return _then(_PhotoUploaded(
      photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PhotoUploaded implements _PhotoUploaded {
  const _$_PhotoUploaded(this.photoURL);

  @override
  final String photoURL;

  @override
  String toString() {
    return 'PupilFormEvent.photoUploaded(photoURL: $photoURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhotoUploaded &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photoURL);

  @JsonKey(ignore: true)
  @override
  _$PhotoUploadedCopyWith<_PhotoUploaded> get copyWith =>
      __$PhotoUploadedCopyWithImpl<_PhotoUploaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deletePhoto,
    required TResult Function(String photoURL) photoUploaded,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function() save,
  }) {
    return photoUploaded(photoURL);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
  }) {
    return photoUploaded?.call(photoURL);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (photoUploaded != null) {
      return photoUploaded(photoURL);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_PhotoUploaded value) photoUploaded,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_Save value) save,
  }) {
    return photoUploaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
  }) {
    return photoUploaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (photoUploaded != null) {
      return photoUploaded(this);
    }
    return orElse();
  }
}

abstract class _PhotoUploaded implements PupilFormEvent {
  const factory _PhotoUploaded(String photoURL) = _$_PhotoUploaded;

  String get photoURL;
  @JsonKey(ignore: true)
  _$PhotoUploadedCopyWith<_PhotoUploaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FirstNameChangedCopyWith<$Res> {
  factory _$FirstNameChangedCopyWith(
          _FirstNameChanged value, $Res Function(_FirstNameChanged) then) =
      __$FirstNameChangedCopyWithImpl<$Res>;
  $Res call({String firstName});
}

/// @nodoc
class __$FirstNameChangedCopyWithImpl<$Res>
    extends _$PupilFormEventCopyWithImpl<$Res>
    implements _$FirstNameChangedCopyWith<$Res> {
  __$FirstNameChangedCopyWithImpl(
      _FirstNameChanged _value, $Res Function(_FirstNameChanged) _then)
      : super(_value, (v) => _then(v as _FirstNameChanged));

  @override
  _FirstNameChanged get _value => super._value as _FirstNameChanged;

  @override
  $Res call({
    Object? firstName = freezed,
  }) {
    return _then(_FirstNameChanged(
      firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FirstNameChanged implements _FirstNameChanged {
  const _$_FirstNameChanged(this.firstName);

  @override
  final String firstName;

  @override
  String toString() {
    return 'PupilFormEvent.firstNameChanged(firstName: $firstName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FirstNameChanged &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName);

  @JsonKey(ignore: true)
  @override
  _$FirstNameChangedCopyWith<_FirstNameChanged> get copyWith =>
      __$FirstNameChangedCopyWithImpl<_FirstNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deletePhoto,
    required TResult Function(String photoURL) photoUploaded,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function() save,
  }) {
    return firstNameChanged(firstName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
  }) {
    return firstNameChanged?.call(firstName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (firstNameChanged != null) {
      return firstNameChanged(firstName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_PhotoUploaded value) photoUploaded,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_Save value) save,
  }) {
    return firstNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
  }) {
    return firstNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (firstNameChanged != null) {
      return firstNameChanged(this);
    }
    return orElse();
  }
}

abstract class _FirstNameChanged implements PupilFormEvent {
  const factory _FirstNameChanged(String firstName) = _$_FirstNameChanged;

  String get firstName;
  @JsonKey(ignore: true)
  _$FirstNameChangedCopyWith<_FirstNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LastNameChangedCopyWith<$Res> {
  factory _$LastNameChangedCopyWith(
          _LastNameChanged value, $Res Function(_LastNameChanged) then) =
      __$LastNameChangedCopyWithImpl<$Res>;
  $Res call({String lastName});
}

/// @nodoc
class __$LastNameChangedCopyWithImpl<$Res>
    extends _$PupilFormEventCopyWithImpl<$Res>
    implements _$LastNameChangedCopyWith<$Res> {
  __$LastNameChangedCopyWithImpl(
      _LastNameChanged _value, $Res Function(_LastNameChanged) _then)
      : super(_value, (v) => _then(v as _LastNameChanged));

  @override
  _LastNameChanged get _value => super._value as _LastNameChanged;

  @override
  $Res call({
    Object? lastName = freezed,
  }) {
    return _then(_LastNameChanged(
      lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LastNameChanged implements _LastNameChanged {
  const _$_LastNameChanged(this.lastName);

  @override
  final String lastName;

  @override
  String toString() {
    return 'PupilFormEvent.lastNameChanged(lastName: $lastName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LastNameChanged &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastName);

  @JsonKey(ignore: true)
  @override
  _$LastNameChangedCopyWith<_LastNameChanged> get copyWith =>
      __$LastNameChangedCopyWithImpl<_LastNameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deletePhoto,
    required TResult Function(String photoURL) photoUploaded,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function() save,
  }) {
    return lastNameChanged(lastName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
  }) {
    return lastNameChanged?.call(lastName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (lastNameChanged != null) {
      return lastNameChanged(lastName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_PhotoUploaded value) photoUploaded,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_Save value) save,
  }) {
    return lastNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
  }) {
    return lastNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (lastNameChanged != null) {
      return lastNameChanged(this);
    }
    return orElse();
  }
}

abstract class _LastNameChanged implements PupilFormEvent {
  const factory _LastNameChanged(String lastName) = _$_LastNameChanged;

  String get lastName;
  @JsonKey(ignore: true)
  _$LastNameChangedCopyWith<_LastNameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveCopyWith<$Res> {
  factory _$SaveCopyWith(_Save value, $Res Function(_Save) then) =
      __$SaveCopyWithImpl<$Res>;
}

/// @nodoc
class __$SaveCopyWithImpl<$Res> extends _$PupilFormEventCopyWithImpl<$Res>
    implements _$SaveCopyWith<$Res> {
  __$SaveCopyWithImpl(_Save _value, $Res Function(_Save) _then)
      : super(_value, (v) => _then(v as _Save));

  @override
  _Save get _value => super._value as _Save;
}

/// @nodoc

class _$_Save implements _Save {
  const _$_Save();

  @override
  String toString() {
    return 'PupilFormEvent.save()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Save);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() deletePhoto,
    required TResult Function(String photoURL) photoUploaded,
    required TResult Function(String firstName) firstNameChanged,
    required TResult Function(String lastName) lastNameChanged,
    required TResult Function() save,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? deletePhoto,
    TResult Function(String photoURL)? photoUploaded,
    TResult Function(String firstName)? firstNameChanged,
    TResult Function(String lastName)? lastNameChanged,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_PhotoUploaded value) photoUploaded,
    required TResult Function(_FirstNameChanged value) firstNameChanged,
    required TResult Function(_LastNameChanged value) lastNameChanged,
    required TResult Function(_Save value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_PhotoUploaded value)? photoUploaded,
    TResult Function(_FirstNameChanged value)? firstNameChanged,
    TResult Function(_LastNameChanged value)? lastNameChanged,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _Save implements PupilFormEvent {
  const factory _Save() = _$_Save;
}
