// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scan_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ScanEventTearOff {
  const _$ScanEventTearOff();

  _ControllerCreated controllerCreated(QRViewController controller) {
    return _ControllerCreated(
      controller,
    );
  }

  _ToggleFlash toggleFlash() {
    return const _ToggleFlash();
  }

  _AddBook addBook() {
    return const _AddBook();
  }

  _ReturnLoan returnLoan() {
    return const _ReturnLoan();
  }

  _PupilSelected pupilSelected(Pupil pupil) {
    return _PupilSelected(
      pupil,
    );
  }

  _ModalDismissed modalDismissed() {
    return const _ModalDismissed();
  }
}

/// @nodoc
const $ScanEvent = _$ScanEventTearOff();

/// @nodoc
mixin _$ScanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QRViewController controller) controllerCreated,
    required TResult Function() toggleFlash,
    required TResult Function() addBook,
    required TResult Function() returnLoan,
    required TResult Function(Pupil pupil) pupilSelected,
    required TResult Function() modalDismissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ControllerCreated value) controllerCreated,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_AddBook value) addBook,
    required TResult Function(_ReturnLoan value) returnLoan,
    required TResult Function(_PupilSelected value) pupilSelected,
    required TResult Function(_ModalDismissed value) modalDismissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanEventCopyWith<$Res> {
  factory $ScanEventCopyWith(ScanEvent value, $Res Function(ScanEvent) then) =
      _$ScanEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScanEventCopyWithImpl<$Res> implements $ScanEventCopyWith<$Res> {
  _$ScanEventCopyWithImpl(this._value, this._then);

  final ScanEvent _value;
  // ignore: unused_field
  final $Res Function(ScanEvent) _then;
}

/// @nodoc
abstract class _$ControllerCreatedCopyWith<$Res> {
  factory _$ControllerCreatedCopyWith(
          _ControllerCreated value, $Res Function(_ControllerCreated) then) =
      __$ControllerCreatedCopyWithImpl<$Res>;
  $Res call({QRViewController controller});
}

/// @nodoc
class __$ControllerCreatedCopyWithImpl<$Res>
    extends _$ScanEventCopyWithImpl<$Res>
    implements _$ControllerCreatedCopyWith<$Res> {
  __$ControllerCreatedCopyWithImpl(
      _ControllerCreated _value, $Res Function(_ControllerCreated) _then)
      : super(_value, (v) => _then(v as _ControllerCreated));

  @override
  _ControllerCreated get _value => super._value as _ControllerCreated;

  @override
  $Res call({
    Object? controller = freezed,
  }) {
    return _then(_ControllerCreated(
      controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as QRViewController,
    ));
  }
}

/// @nodoc

class _$_ControllerCreated implements _ControllerCreated {
  const _$_ControllerCreated(this.controller);

  @override
  final QRViewController controller;

  @override
  String toString() {
    return 'ScanEvent.controllerCreated(controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ControllerCreated &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @JsonKey(ignore: true)
  @override
  _$ControllerCreatedCopyWith<_ControllerCreated> get copyWith =>
      __$ControllerCreatedCopyWithImpl<_ControllerCreated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QRViewController controller) controllerCreated,
    required TResult Function() toggleFlash,
    required TResult Function() addBook,
    required TResult Function() returnLoan,
    required TResult Function(Pupil pupil) pupilSelected,
    required TResult Function() modalDismissed,
  }) {
    return controllerCreated(controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
  }) {
    return controllerCreated?.call(controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
    required TResult orElse(),
  }) {
    if (controllerCreated != null) {
      return controllerCreated(controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ControllerCreated value) controllerCreated,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_AddBook value) addBook,
    required TResult Function(_ReturnLoan value) returnLoan,
    required TResult Function(_PupilSelected value) pupilSelected,
    required TResult Function(_ModalDismissed value) modalDismissed,
  }) {
    return controllerCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
  }) {
    return controllerCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
    required TResult orElse(),
  }) {
    if (controllerCreated != null) {
      return controllerCreated(this);
    }
    return orElse();
  }
}

abstract class _ControllerCreated implements ScanEvent {
  const factory _ControllerCreated(QRViewController controller) =
      _$_ControllerCreated;

  QRViewController get controller;
  @JsonKey(ignore: true)
  _$ControllerCreatedCopyWith<_ControllerCreated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ToggleFlashCopyWith<$Res> {
  factory _$ToggleFlashCopyWith(
          _ToggleFlash value, $Res Function(_ToggleFlash) then) =
      __$ToggleFlashCopyWithImpl<$Res>;
}

/// @nodoc
class __$ToggleFlashCopyWithImpl<$Res> extends _$ScanEventCopyWithImpl<$Res>
    implements _$ToggleFlashCopyWith<$Res> {
  __$ToggleFlashCopyWithImpl(
      _ToggleFlash _value, $Res Function(_ToggleFlash) _then)
      : super(_value, (v) => _then(v as _ToggleFlash));

  @override
  _ToggleFlash get _value => super._value as _ToggleFlash;
}

/// @nodoc

class _$_ToggleFlash implements _ToggleFlash {
  const _$_ToggleFlash();

  @override
  String toString() {
    return 'ScanEvent.toggleFlash()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ToggleFlash);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QRViewController controller) controllerCreated,
    required TResult Function() toggleFlash,
    required TResult Function() addBook,
    required TResult Function() returnLoan,
    required TResult Function(Pupil pupil) pupilSelected,
    required TResult Function() modalDismissed,
  }) {
    return toggleFlash();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
  }) {
    return toggleFlash?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
    required TResult orElse(),
  }) {
    if (toggleFlash != null) {
      return toggleFlash();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ControllerCreated value) controllerCreated,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_AddBook value) addBook,
    required TResult Function(_ReturnLoan value) returnLoan,
    required TResult Function(_PupilSelected value) pupilSelected,
    required TResult Function(_ModalDismissed value) modalDismissed,
  }) {
    return toggleFlash(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
  }) {
    return toggleFlash?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
    required TResult orElse(),
  }) {
    if (toggleFlash != null) {
      return toggleFlash(this);
    }
    return orElse();
  }
}

abstract class _ToggleFlash implements ScanEvent {
  const factory _ToggleFlash() = _$_ToggleFlash;
}

/// @nodoc
abstract class _$AddBookCopyWith<$Res> {
  factory _$AddBookCopyWith(_AddBook value, $Res Function(_AddBook) then) =
      __$AddBookCopyWithImpl<$Res>;
}

/// @nodoc
class __$AddBookCopyWithImpl<$Res> extends _$ScanEventCopyWithImpl<$Res>
    implements _$AddBookCopyWith<$Res> {
  __$AddBookCopyWithImpl(_AddBook _value, $Res Function(_AddBook) _then)
      : super(_value, (v) => _then(v as _AddBook));

  @override
  _AddBook get _value => super._value as _AddBook;
}

/// @nodoc

class _$_AddBook implements _AddBook {
  const _$_AddBook();

  @override
  String toString() {
    return 'ScanEvent.addBook()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AddBook);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QRViewController controller) controllerCreated,
    required TResult Function() toggleFlash,
    required TResult Function() addBook,
    required TResult Function() returnLoan,
    required TResult Function(Pupil pupil) pupilSelected,
    required TResult Function() modalDismissed,
  }) {
    return addBook();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
  }) {
    return addBook?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
    required TResult orElse(),
  }) {
    if (addBook != null) {
      return addBook();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ControllerCreated value) controllerCreated,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_AddBook value) addBook,
    required TResult Function(_ReturnLoan value) returnLoan,
    required TResult Function(_PupilSelected value) pupilSelected,
    required TResult Function(_ModalDismissed value) modalDismissed,
  }) {
    return addBook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
  }) {
    return addBook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
    required TResult orElse(),
  }) {
    if (addBook != null) {
      return addBook(this);
    }
    return orElse();
  }
}

abstract class _AddBook implements ScanEvent {
  const factory _AddBook() = _$_AddBook;
}

/// @nodoc
abstract class _$ReturnLoanCopyWith<$Res> {
  factory _$ReturnLoanCopyWith(
          _ReturnLoan value, $Res Function(_ReturnLoan) then) =
      __$ReturnLoanCopyWithImpl<$Res>;
}

/// @nodoc
class __$ReturnLoanCopyWithImpl<$Res> extends _$ScanEventCopyWithImpl<$Res>
    implements _$ReturnLoanCopyWith<$Res> {
  __$ReturnLoanCopyWithImpl(
      _ReturnLoan _value, $Res Function(_ReturnLoan) _then)
      : super(_value, (v) => _then(v as _ReturnLoan));

  @override
  _ReturnLoan get _value => super._value as _ReturnLoan;
}

/// @nodoc

class _$_ReturnLoan implements _ReturnLoan {
  const _$_ReturnLoan();

  @override
  String toString() {
    return 'ScanEvent.returnLoan()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ReturnLoan);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QRViewController controller) controllerCreated,
    required TResult Function() toggleFlash,
    required TResult Function() addBook,
    required TResult Function() returnLoan,
    required TResult Function(Pupil pupil) pupilSelected,
    required TResult Function() modalDismissed,
  }) {
    return returnLoan();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
  }) {
    return returnLoan?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
    required TResult orElse(),
  }) {
    if (returnLoan != null) {
      return returnLoan();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ControllerCreated value) controllerCreated,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_AddBook value) addBook,
    required TResult Function(_ReturnLoan value) returnLoan,
    required TResult Function(_PupilSelected value) pupilSelected,
    required TResult Function(_ModalDismissed value) modalDismissed,
  }) {
    return returnLoan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
  }) {
    return returnLoan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
    required TResult orElse(),
  }) {
    if (returnLoan != null) {
      return returnLoan(this);
    }
    return orElse();
  }
}

abstract class _ReturnLoan implements ScanEvent {
  const factory _ReturnLoan() = _$_ReturnLoan;
}

/// @nodoc
abstract class _$PupilSelectedCopyWith<$Res> {
  factory _$PupilSelectedCopyWith(
          _PupilSelected value, $Res Function(_PupilSelected) then) =
      __$PupilSelectedCopyWithImpl<$Res>;
  $Res call({Pupil pupil});

  $PupilCopyWith<$Res> get pupil;
}

/// @nodoc
class __$PupilSelectedCopyWithImpl<$Res> extends _$ScanEventCopyWithImpl<$Res>
    implements _$PupilSelectedCopyWith<$Res> {
  __$PupilSelectedCopyWithImpl(
      _PupilSelected _value, $Res Function(_PupilSelected) _then)
      : super(_value, (v) => _then(v as _PupilSelected));

  @override
  _PupilSelected get _value => super._value as _PupilSelected;

  @override
  $Res call({
    Object? pupil = freezed,
  }) {
    return _then(_PupilSelected(
      pupil == freezed
          ? _value.pupil
          : pupil // ignore: cast_nullable_to_non_nullable
              as Pupil,
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

class _$_PupilSelected implements _PupilSelected {
  const _$_PupilSelected(this.pupil);

  @override
  final Pupil pupil;

  @override
  String toString() {
    return 'ScanEvent.pupilSelected(pupil: $pupil)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PupilSelected &&
            (identical(other.pupil, pupil) || other.pupil == pupil));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pupil);

  @JsonKey(ignore: true)
  @override
  _$PupilSelectedCopyWith<_PupilSelected> get copyWith =>
      __$PupilSelectedCopyWithImpl<_PupilSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QRViewController controller) controllerCreated,
    required TResult Function() toggleFlash,
    required TResult Function() addBook,
    required TResult Function() returnLoan,
    required TResult Function(Pupil pupil) pupilSelected,
    required TResult Function() modalDismissed,
  }) {
    return pupilSelected(pupil);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
  }) {
    return pupilSelected?.call(pupil);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
    required TResult orElse(),
  }) {
    if (pupilSelected != null) {
      return pupilSelected(pupil);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ControllerCreated value) controllerCreated,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_AddBook value) addBook,
    required TResult Function(_ReturnLoan value) returnLoan,
    required TResult Function(_PupilSelected value) pupilSelected,
    required TResult Function(_ModalDismissed value) modalDismissed,
  }) {
    return pupilSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
  }) {
    return pupilSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
    required TResult orElse(),
  }) {
    if (pupilSelected != null) {
      return pupilSelected(this);
    }
    return orElse();
  }
}

abstract class _PupilSelected implements ScanEvent {
  const factory _PupilSelected(Pupil pupil) = _$_PupilSelected;

  Pupil get pupil;
  @JsonKey(ignore: true)
  _$PupilSelectedCopyWith<_PupilSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ModalDismissedCopyWith<$Res> {
  factory _$ModalDismissedCopyWith(
          _ModalDismissed value, $Res Function(_ModalDismissed) then) =
      __$ModalDismissedCopyWithImpl<$Res>;
}

/// @nodoc
class __$ModalDismissedCopyWithImpl<$Res> extends _$ScanEventCopyWithImpl<$Res>
    implements _$ModalDismissedCopyWith<$Res> {
  __$ModalDismissedCopyWithImpl(
      _ModalDismissed _value, $Res Function(_ModalDismissed) _then)
      : super(_value, (v) => _then(v as _ModalDismissed));

  @override
  _ModalDismissed get _value => super._value as _ModalDismissed;
}

/// @nodoc

class _$_ModalDismissed implements _ModalDismissed {
  const _$_ModalDismissed();

  @override
  String toString() {
    return 'ScanEvent.modalDismissed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ModalDismissed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QRViewController controller) controllerCreated,
    required TResult Function() toggleFlash,
    required TResult Function() addBook,
    required TResult Function() returnLoan,
    required TResult Function(Pupil pupil) pupilSelected,
    required TResult Function() modalDismissed,
  }) {
    return modalDismissed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
  }) {
    return modalDismissed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QRViewController controller)? controllerCreated,
    TResult Function()? toggleFlash,
    TResult Function()? addBook,
    TResult Function()? returnLoan,
    TResult Function(Pupil pupil)? pupilSelected,
    TResult Function()? modalDismissed,
    required TResult orElse(),
  }) {
    if (modalDismissed != null) {
      return modalDismissed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ControllerCreated value) controllerCreated,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_AddBook value) addBook,
    required TResult Function(_ReturnLoan value) returnLoan,
    required TResult Function(_PupilSelected value) pupilSelected,
    required TResult Function(_ModalDismissed value) modalDismissed,
  }) {
    return modalDismissed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
  }) {
    return modalDismissed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ControllerCreated value)? controllerCreated,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_AddBook value)? addBook,
    TResult Function(_ReturnLoan value)? returnLoan,
    TResult Function(_PupilSelected value)? pupilSelected,
    TResult Function(_ModalDismissed value)? modalDismissed,
    required TResult orElse(),
  }) {
    if (modalDismissed != null) {
      return modalDismissed(this);
    }
    return orElse();
  }
}

abstract class _ModalDismissed implements ScanEvent {
  const factory _ModalDismissed() = _$_ModalDismissed;
}

/// @nodoc
class _$ScanStateTearOff {
  const _$ScanStateTearOff();

  _ScanState call(
      {QRViewController? controller,
      Barcode? barCode,
      Loan? loan,
      Book? book,
      Pupil? pupil,
      bool isUnknownCode = false,
      bool isUnknownPupil = false,
      bool maxLoansReached = false,
      bool isISBN = false,
      bool isPupil = false,
      bool isLoading = false,
      bool isSaving = false,
      bool isSuccess = false,
      String? errorText}) {
    return _ScanState(
      controller: controller,
      barCode: barCode,
      loan: loan,
      book: book,
      pupil: pupil,
      isUnknownCode: isUnknownCode,
      isUnknownPupil: isUnknownPupil,
      maxLoansReached: maxLoansReached,
      isISBN: isISBN,
      isPupil: isPupil,
      isLoading: isLoading,
      isSaving: isSaving,
      isSuccess: isSuccess,
      errorText: errorText,
    );
  }
}

/// @nodoc
const $ScanState = _$ScanStateTearOff();

/// @nodoc
mixin _$ScanState {
  QRViewController? get controller => throw _privateConstructorUsedError;
  Barcode? get barCode => throw _privateConstructorUsedError;
  Loan? get loan => throw _privateConstructorUsedError;
  Book? get book => throw _privateConstructorUsedError;
  Pupil? get pupil => throw _privateConstructorUsedError;
  bool get isUnknownCode => throw _privateConstructorUsedError;
  bool get isUnknownPupil => throw _privateConstructorUsedError;
  bool get maxLoansReached => throw _privateConstructorUsedError;
  bool get isISBN => throw _privateConstructorUsedError;
  bool get isPupil => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanStateCopyWith<ScanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanStateCopyWith<$Res> {
  factory $ScanStateCopyWith(ScanState value, $Res Function(ScanState) then) =
      _$ScanStateCopyWithImpl<$Res>;
  $Res call(
      {QRViewController? controller,
      Barcode? barCode,
      Loan? loan,
      Book? book,
      Pupil? pupil,
      bool isUnknownCode,
      bool isUnknownPupil,
      bool maxLoansReached,
      bool isISBN,
      bool isPupil,
      bool isLoading,
      bool isSaving,
      bool isSuccess,
      String? errorText});

  $LoanCopyWith<$Res>? get loan;
  $BookCopyWith<$Res>? get book;
  $PupilCopyWith<$Res>? get pupil;
}

/// @nodoc
class _$ScanStateCopyWithImpl<$Res> implements $ScanStateCopyWith<$Res> {
  _$ScanStateCopyWithImpl(this._value, this._then);

  final ScanState _value;
  // ignore: unused_field
  final $Res Function(ScanState) _then;

  @override
  $Res call({
    Object? controller = freezed,
    Object? barCode = freezed,
    Object? loan = freezed,
    Object? book = freezed,
    Object? pupil = freezed,
    Object? isUnknownCode = freezed,
    Object? isUnknownPupil = freezed,
    Object? maxLoansReached = freezed,
    Object? isISBN = freezed,
    Object? isPupil = freezed,
    Object? isLoading = freezed,
    Object? isSaving = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as QRViewController?,
      barCode: barCode == freezed
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as Barcode?,
      loan: loan == freezed
          ? _value.loan
          : loan // ignore: cast_nullable_to_non_nullable
              as Loan?,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book?,
      pupil: pupil == freezed
          ? _value.pupil
          : pupil // ignore: cast_nullable_to_non_nullable
              as Pupil?,
      isUnknownCode: isUnknownCode == freezed
          ? _value.isUnknownCode
          : isUnknownCode // ignore: cast_nullable_to_non_nullable
              as bool,
      isUnknownPupil: isUnknownPupil == freezed
          ? _value.isUnknownPupil
          : isUnknownPupil // ignore: cast_nullable_to_non_nullable
              as bool,
      maxLoansReached: maxLoansReached == freezed
          ? _value.maxLoansReached
          : maxLoansReached // ignore: cast_nullable_to_non_nullable
              as bool,
      isISBN: isISBN == freezed
          ? _value.isISBN
          : isISBN // ignore: cast_nullable_to_non_nullable
              as bool,
      isPupil: isPupil == freezed
          ? _value.isPupil
          : isPupil // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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
  $LoanCopyWith<$Res>? get loan {
    if (_value.loan == null) {
      return null;
    }

    return $LoanCopyWith<$Res>(_value.loan!, (value) {
      return _then(_value.copyWith(loan: value));
    });
  }

  @override
  $BookCopyWith<$Res>? get book {
    if (_value.book == null) {
      return null;
    }

    return $BookCopyWith<$Res>(_value.book!, (value) {
      return _then(_value.copyWith(book: value));
    });
  }

  @override
  $PupilCopyWith<$Res>? get pupil {
    if (_value.pupil == null) {
      return null;
    }

    return $PupilCopyWith<$Res>(_value.pupil!, (value) {
      return _then(_value.copyWith(pupil: value));
    });
  }
}

/// @nodoc
abstract class _$ScanStateCopyWith<$Res> implements $ScanStateCopyWith<$Res> {
  factory _$ScanStateCopyWith(
          _ScanState value, $Res Function(_ScanState) then) =
      __$ScanStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {QRViewController? controller,
      Barcode? barCode,
      Loan? loan,
      Book? book,
      Pupil? pupil,
      bool isUnknownCode,
      bool isUnknownPupil,
      bool maxLoansReached,
      bool isISBN,
      bool isPupil,
      bool isLoading,
      bool isSaving,
      bool isSuccess,
      String? errorText});

  @override
  $LoanCopyWith<$Res>? get loan;
  @override
  $BookCopyWith<$Res>? get book;
  @override
  $PupilCopyWith<$Res>? get pupil;
}

/// @nodoc
class __$ScanStateCopyWithImpl<$Res> extends _$ScanStateCopyWithImpl<$Res>
    implements _$ScanStateCopyWith<$Res> {
  __$ScanStateCopyWithImpl(_ScanState _value, $Res Function(_ScanState) _then)
      : super(_value, (v) => _then(v as _ScanState));

  @override
  _ScanState get _value => super._value as _ScanState;

  @override
  $Res call({
    Object? controller = freezed,
    Object? barCode = freezed,
    Object? loan = freezed,
    Object? book = freezed,
    Object? pupil = freezed,
    Object? isUnknownCode = freezed,
    Object? isUnknownPupil = freezed,
    Object? maxLoansReached = freezed,
    Object? isISBN = freezed,
    Object? isPupil = freezed,
    Object? isLoading = freezed,
    Object? isSaving = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_ScanState(
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as QRViewController?,
      barCode: barCode == freezed
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as Barcode?,
      loan: loan == freezed
          ? _value.loan
          : loan // ignore: cast_nullable_to_non_nullable
              as Loan?,
      book: book == freezed
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book?,
      pupil: pupil == freezed
          ? _value.pupil
          : pupil // ignore: cast_nullable_to_non_nullable
              as Pupil?,
      isUnknownCode: isUnknownCode == freezed
          ? _value.isUnknownCode
          : isUnknownCode // ignore: cast_nullable_to_non_nullable
              as bool,
      isUnknownPupil: isUnknownPupil == freezed
          ? _value.isUnknownPupil
          : isUnknownPupil // ignore: cast_nullable_to_non_nullable
              as bool,
      maxLoansReached: maxLoansReached == freezed
          ? _value.maxLoansReached
          : maxLoansReached // ignore: cast_nullable_to_non_nullable
              as bool,
      isISBN: isISBN == freezed
          ? _value.isISBN
          : isISBN // ignore: cast_nullable_to_non_nullable
              as bool,
      isPupil: isPupil == freezed
          ? _value.isPupil
          : isPupil // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
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

class _$_ScanState implements _ScanState {
  const _$_ScanState(
      {this.controller,
      this.barCode,
      this.loan,
      this.book,
      this.pupil,
      this.isUnknownCode = false,
      this.isUnknownPupil = false,
      this.maxLoansReached = false,
      this.isISBN = false,
      this.isPupil = false,
      this.isLoading = false,
      this.isSaving = false,
      this.isSuccess = false,
      this.errorText});

  @override
  final QRViewController? controller;
  @override
  final Barcode? barCode;
  @override
  final Loan? loan;
  @override
  final Book? book;
  @override
  final Pupil? pupil;
  @JsonKey(defaultValue: false)
  @override
  final bool isUnknownCode;
  @JsonKey(defaultValue: false)
  @override
  final bool isUnknownPupil;
  @JsonKey(defaultValue: false)
  @override
  final bool maxLoansReached;
  @JsonKey(defaultValue: false)
  @override
  final bool isISBN;
  @JsonKey(defaultValue: false)
  @override
  final bool isPupil;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
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
    return 'ScanState(controller: $controller, barCode: $barCode, loan: $loan, book: $book, pupil: $pupil, isUnknownCode: $isUnknownCode, isUnknownPupil: $isUnknownPupil, maxLoansReached: $maxLoansReached, isISBN: $isISBN, isPupil: $isPupil, isLoading: $isLoading, isSaving: $isSaving, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScanState &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.barCode, barCode) || other.barCode == barCode) &&
            (identical(other.loan, loan) || other.loan == loan) &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.pupil, pupil) || other.pupil == pupil) &&
            (identical(other.isUnknownCode, isUnknownCode) ||
                other.isUnknownCode == isUnknownCode) &&
            (identical(other.isUnknownPupil, isUnknownPupil) ||
                other.isUnknownPupil == isUnknownPupil) &&
            (identical(other.maxLoansReached, maxLoansReached) ||
                other.maxLoansReached == maxLoansReached) &&
            (identical(other.isISBN, isISBN) || other.isISBN == isISBN) &&
            (identical(other.isPupil, isPupil) || other.isPupil == isPupil) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      controller,
      barCode,
      loan,
      book,
      pupil,
      isUnknownCode,
      isUnknownPupil,
      maxLoansReached,
      isISBN,
      isPupil,
      isLoading,
      isSaving,
      isSuccess,
      errorText);

  @JsonKey(ignore: true)
  @override
  _$ScanStateCopyWith<_ScanState> get copyWith =>
      __$ScanStateCopyWithImpl<_ScanState>(this, _$identity);
}

abstract class _ScanState implements ScanState {
  const factory _ScanState(
      {QRViewController? controller,
      Barcode? barCode,
      Loan? loan,
      Book? book,
      Pupil? pupil,
      bool isUnknownCode,
      bool isUnknownPupil,
      bool maxLoansReached,
      bool isISBN,
      bool isPupil,
      bool isLoading,
      bool isSaving,
      bool isSuccess,
      String? errorText}) = _$_ScanState;

  @override
  QRViewController? get controller;
  @override
  Barcode? get barCode;
  @override
  Loan? get loan;
  @override
  Book? get book;
  @override
  Pupil? get pupil;
  @override
  bool get isUnknownCode;
  @override
  bool get isUnknownPupil;
  @override
  bool get maxLoansReached;
  @override
  bool get isISBN;
  @override
  bool get isPupil;
  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  bool get isSuccess;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$ScanStateCopyWith<_ScanState> get copyWith =>
      throw _privateConstructorUsedError;
}
