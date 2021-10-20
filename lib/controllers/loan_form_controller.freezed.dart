// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'loan_form_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoanFormEventTearOff {
  const _$LoanFormEventTearOff();

  _PupilChanged pupilChanged(Pupil pupil) {
    return _PupilChanged(
      pupil,
    );
  }

  _LoanDateChanged loanDateChanged(DateTime date) {
    return _LoanDateChanged(
      date,
    );
  }

  _ExpectedReturnDateChanged expectedReturnDateChanged(DateTime date) {
    return _ExpectedReturnDateChanged(
      date,
    );
  }

  _Save save() {
    return const _Save();
  }
}

/// @nodoc
const $LoanFormEvent = _$LoanFormEventTearOff();

/// @nodoc
mixin _$LoanFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Pupil pupil) pupilChanged,
    required TResult Function(DateTime date) loanDateChanged,
    required TResult Function(DateTime date) expectedReturnDateChanged,
    required TResult Function() save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Pupil pupil)? pupilChanged,
    TResult Function(DateTime date)? loanDateChanged,
    TResult Function(DateTime date)? expectedReturnDateChanged,
    TResult Function()? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Pupil pupil)? pupilChanged,
    TResult Function(DateTime date)? loanDateChanged,
    TResult Function(DateTime date)? expectedReturnDateChanged,
    TResult Function()? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PupilChanged value) pupilChanged,
    required TResult Function(_LoanDateChanged value) loanDateChanged,
    required TResult Function(_ExpectedReturnDateChanged value)
        expectedReturnDateChanged,
    required TResult Function(_Save value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PupilChanged value)? pupilChanged,
    TResult Function(_LoanDateChanged value)? loanDateChanged,
    TResult Function(_ExpectedReturnDateChanged value)?
        expectedReturnDateChanged,
    TResult Function(_Save value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PupilChanged value)? pupilChanged,
    TResult Function(_LoanDateChanged value)? loanDateChanged,
    TResult Function(_ExpectedReturnDateChanged value)?
        expectedReturnDateChanged,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanFormEventCopyWith<$Res> {
  factory $LoanFormEventCopyWith(
          LoanFormEvent value, $Res Function(LoanFormEvent) then) =
      _$LoanFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoanFormEventCopyWithImpl<$Res>
    implements $LoanFormEventCopyWith<$Res> {
  _$LoanFormEventCopyWithImpl(this._value, this._then);

  final LoanFormEvent _value;
  // ignore: unused_field
  final $Res Function(LoanFormEvent) _then;
}

/// @nodoc
abstract class _$PupilChangedCopyWith<$Res> {
  factory _$PupilChangedCopyWith(
          _PupilChanged value, $Res Function(_PupilChanged) then) =
      __$PupilChangedCopyWithImpl<$Res>;
  $Res call({Pupil pupil});

  $PupilCopyWith<$Res> get pupil;
}

/// @nodoc
class __$PupilChangedCopyWithImpl<$Res>
    extends _$LoanFormEventCopyWithImpl<$Res>
    implements _$PupilChangedCopyWith<$Res> {
  __$PupilChangedCopyWithImpl(
      _PupilChanged _value, $Res Function(_PupilChanged) _then)
      : super(_value, (v) => _then(v as _PupilChanged));

  @override
  _PupilChanged get _value => super._value as _PupilChanged;

  @override
  $Res call({
    Object? pupil = freezed,
  }) {
    return _then(_PupilChanged(
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

class _$_PupilChanged implements _PupilChanged {
  const _$_PupilChanged(this.pupil);

  @override
  final Pupil pupil;

  @override
  String toString() {
    return 'LoanFormEvent.pupilChanged(pupil: $pupil)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PupilChanged &&
            (identical(other.pupil, pupil) || other.pupil == pupil));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pupil);

  @JsonKey(ignore: true)
  @override
  _$PupilChangedCopyWith<_PupilChanged> get copyWith =>
      __$PupilChangedCopyWithImpl<_PupilChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Pupil pupil) pupilChanged,
    required TResult Function(DateTime date) loanDateChanged,
    required TResult Function(DateTime date) expectedReturnDateChanged,
    required TResult Function() save,
  }) {
    return pupilChanged(pupil);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Pupil pupil)? pupilChanged,
    TResult Function(DateTime date)? loanDateChanged,
    TResult Function(DateTime date)? expectedReturnDateChanged,
    TResult Function()? save,
  }) {
    return pupilChanged?.call(pupil);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Pupil pupil)? pupilChanged,
    TResult Function(DateTime date)? loanDateChanged,
    TResult Function(DateTime date)? expectedReturnDateChanged,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (pupilChanged != null) {
      return pupilChanged(pupil);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PupilChanged value) pupilChanged,
    required TResult Function(_LoanDateChanged value) loanDateChanged,
    required TResult Function(_ExpectedReturnDateChanged value)
        expectedReturnDateChanged,
    required TResult Function(_Save value) save,
  }) {
    return pupilChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PupilChanged value)? pupilChanged,
    TResult Function(_LoanDateChanged value)? loanDateChanged,
    TResult Function(_ExpectedReturnDateChanged value)?
        expectedReturnDateChanged,
    TResult Function(_Save value)? save,
  }) {
    return pupilChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PupilChanged value)? pupilChanged,
    TResult Function(_LoanDateChanged value)? loanDateChanged,
    TResult Function(_ExpectedReturnDateChanged value)?
        expectedReturnDateChanged,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (pupilChanged != null) {
      return pupilChanged(this);
    }
    return orElse();
  }
}

abstract class _PupilChanged implements LoanFormEvent {
  const factory _PupilChanged(Pupil pupil) = _$_PupilChanged;

  Pupil get pupil;
  @JsonKey(ignore: true)
  _$PupilChangedCopyWith<_PupilChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoanDateChangedCopyWith<$Res> {
  factory _$LoanDateChangedCopyWith(
          _LoanDateChanged value, $Res Function(_LoanDateChanged) then) =
      __$LoanDateChangedCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$LoanDateChangedCopyWithImpl<$Res>
    extends _$LoanFormEventCopyWithImpl<$Res>
    implements _$LoanDateChangedCopyWith<$Res> {
  __$LoanDateChangedCopyWithImpl(
      _LoanDateChanged _value, $Res Function(_LoanDateChanged) _then)
      : super(_value, (v) => _then(v as _LoanDateChanged));

  @override
  _LoanDateChanged get _value => super._value as _LoanDateChanged;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_LoanDateChanged(
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_LoanDateChanged implements _LoanDateChanged {
  const _$_LoanDateChanged(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'LoanFormEvent.loanDateChanged(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoanDateChanged &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  _$LoanDateChangedCopyWith<_LoanDateChanged> get copyWith =>
      __$LoanDateChangedCopyWithImpl<_LoanDateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Pupil pupil) pupilChanged,
    required TResult Function(DateTime date) loanDateChanged,
    required TResult Function(DateTime date) expectedReturnDateChanged,
    required TResult Function() save,
  }) {
    return loanDateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Pupil pupil)? pupilChanged,
    TResult Function(DateTime date)? loanDateChanged,
    TResult Function(DateTime date)? expectedReturnDateChanged,
    TResult Function()? save,
  }) {
    return loanDateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Pupil pupil)? pupilChanged,
    TResult Function(DateTime date)? loanDateChanged,
    TResult Function(DateTime date)? expectedReturnDateChanged,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (loanDateChanged != null) {
      return loanDateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PupilChanged value) pupilChanged,
    required TResult Function(_LoanDateChanged value) loanDateChanged,
    required TResult Function(_ExpectedReturnDateChanged value)
        expectedReturnDateChanged,
    required TResult Function(_Save value) save,
  }) {
    return loanDateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PupilChanged value)? pupilChanged,
    TResult Function(_LoanDateChanged value)? loanDateChanged,
    TResult Function(_ExpectedReturnDateChanged value)?
        expectedReturnDateChanged,
    TResult Function(_Save value)? save,
  }) {
    return loanDateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PupilChanged value)? pupilChanged,
    TResult Function(_LoanDateChanged value)? loanDateChanged,
    TResult Function(_ExpectedReturnDateChanged value)?
        expectedReturnDateChanged,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (loanDateChanged != null) {
      return loanDateChanged(this);
    }
    return orElse();
  }
}

abstract class _LoanDateChanged implements LoanFormEvent {
  const factory _LoanDateChanged(DateTime date) = _$_LoanDateChanged;

  DateTime get date;
  @JsonKey(ignore: true)
  _$LoanDateChangedCopyWith<_LoanDateChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ExpectedReturnDateChangedCopyWith<$Res> {
  factory _$ExpectedReturnDateChangedCopyWith(_ExpectedReturnDateChanged value,
          $Res Function(_ExpectedReturnDateChanged) then) =
      __$ExpectedReturnDateChangedCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$ExpectedReturnDateChangedCopyWithImpl<$Res>
    extends _$LoanFormEventCopyWithImpl<$Res>
    implements _$ExpectedReturnDateChangedCopyWith<$Res> {
  __$ExpectedReturnDateChangedCopyWithImpl(_ExpectedReturnDateChanged _value,
      $Res Function(_ExpectedReturnDateChanged) _then)
      : super(_value, (v) => _then(v as _ExpectedReturnDateChanged));

  @override
  _ExpectedReturnDateChanged get _value =>
      super._value as _ExpectedReturnDateChanged;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_ExpectedReturnDateChanged(
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ExpectedReturnDateChanged implements _ExpectedReturnDateChanged {
  const _$_ExpectedReturnDateChanged(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'LoanFormEvent.expectedReturnDateChanged(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExpectedReturnDateChanged &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  _$ExpectedReturnDateChangedCopyWith<_ExpectedReturnDateChanged>
      get copyWith =>
          __$ExpectedReturnDateChangedCopyWithImpl<_ExpectedReturnDateChanged>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Pupil pupil) pupilChanged,
    required TResult Function(DateTime date) loanDateChanged,
    required TResult Function(DateTime date) expectedReturnDateChanged,
    required TResult Function() save,
  }) {
    return expectedReturnDateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Pupil pupil)? pupilChanged,
    TResult Function(DateTime date)? loanDateChanged,
    TResult Function(DateTime date)? expectedReturnDateChanged,
    TResult Function()? save,
  }) {
    return expectedReturnDateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Pupil pupil)? pupilChanged,
    TResult Function(DateTime date)? loanDateChanged,
    TResult Function(DateTime date)? expectedReturnDateChanged,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (expectedReturnDateChanged != null) {
      return expectedReturnDateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PupilChanged value) pupilChanged,
    required TResult Function(_LoanDateChanged value) loanDateChanged,
    required TResult Function(_ExpectedReturnDateChanged value)
        expectedReturnDateChanged,
    required TResult Function(_Save value) save,
  }) {
    return expectedReturnDateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PupilChanged value)? pupilChanged,
    TResult Function(_LoanDateChanged value)? loanDateChanged,
    TResult Function(_ExpectedReturnDateChanged value)?
        expectedReturnDateChanged,
    TResult Function(_Save value)? save,
  }) {
    return expectedReturnDateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PupilChanged value)? pupilChanged,
    TResult Function(_LoanDateChanged value)? loanDateChanged,
    TResult Function(_ExpectedReturnDateChanged value)?
        expectedReturnDateChanged,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (expectedReturnDateChanged != null) {
      return expectedReturnDateChanged(this);
    }
    return orElse();
  }
}

abstract class _ExpectedReturnDateChanged implements LoanFormEvent {
  const factory _ExpectedReturnDateChanged(DateTime date) =
      _$_ExpectedReturnDateChanged;

  DateTime get date;
  @JsonKey(ignore: true)
  _$ExpectedReturnDateChangedCopyWith<_ExpectedReturnDateChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveCopyWith<$Res> {
  factory _$SaveCopyWith(_Save value, $Res Function(_Save) then) =
      __$SaveCopyWithImpl<$Res>;
}

/// @nodoc
class __$SaveCopyWithImpl<$Res> extends _$LoanFormEventCopyWithImpl<$Res>
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
    return 'LoanFormEvent.save()';
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
    required TResult Function(Pupil pupil) pupilChanged,
    required TResult Function(DateTime date) loanDateChanged,
    required TResult Function(DateTime date) expectedReturnDateChanged,
    required TResult Function() save,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Pupil pupil)? pupilChanged,
    TResult Function(DateTime date)? loanDateChanged,
    TResult Function(DateTime date)? expectedReturnDateChanged,
    TResult Function()? save,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Pupil pupil)? pupilChanged,
    TResult Function(DateTime date)? loanDateChanged,
    TResult Function(DateTime date)? expectedReturnDateChanged,
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
    required TResult Function(_PupilChanged value) pupilChanged,
    required TResult Function(_LoanDateChanged value) loanDateChanged,
    required TResult Function(_ExpectedReturnDateChanged value)
        expectedReturnDateChanged,
    required TResult Function(_Save value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_PupilChanged value)? pupilChanged,
    TResult Function(_LoanDateChanged value)? loanDateChanged,
    TResult Function(_ExpectedReturnDateChanged value)?
        expectedReturnDateChanged,
    TResult Function(_Save value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PupilChanged value)? pupilChanged,
    TResult Function(_LoanDateChanged value)? loanDateChanged,
    TResult Function(_ExpectedReturnDateChanged value)?
        expectedReturnDateChanged,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _Save implements LoanFormEvent {
  const factory _Save() = _$_Save;
}

/// @nodoc
class _$LoanFormStateTearOff {
  const _$LoanFormStateTearOff();

  _LoanFormState call(
      {required Loan loan,
      bool canSubmit = false,
      bool isSaving = false,
      bool isSuccess = false,
      String? errorText}) {
    return _LoanFormState(
      loan: loan,
      canSubmit: canSubmit,
      isSaving: isSaving,
      isSuccess: isSuccess,
      errorText: errorText,
    );
  }
}

/// @nodoc
const $LoanFormState = _$LoanFormStateTearOff();

/// @nodoc
mixin _$LoanFormState {
  Loan get loan => throw _privateConstructorUsedError;
  bool get canSubmit => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoanFormStateCopyWith<LoanFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanFormStateCopyWith<$Res> {
  factory $LoanFormStateCopyWith(
          LoanFormState value, $Res Function(LoanFormState) then) =
      _$LoanFormStateCopyWithImpl<$Res>;
  $Res call(
      {Loan loan,
      bool canSubmit,
      bool isSaving,
      bool isSuccess,
      String? errorText});

  $LoanCopyWith<$Res> get loan;
}

/// @nodoc
class _$LoanFormStateCopyWithImpl<$Res>
    implements $LoanFormStateCopyWith<$Res> {
  _$LoanFormStateCopyWithImpl(this._value, this._then);

  final LoanFormState _value;
  // ignore: unused_field
  final $Res Function(LoanFormState) _then;

  @override
  $Res call({
    Object? loan = freezed,
    Object? canSubmit = freezed,
    Object? isSaving = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      loan: loan == freezed
          ? _value.loan
          : loan // ignore: cast_nullable_to_non_nullable
              as Loan,
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
  $LoanCopyWith<$Res> get loan {
    return $LoanCopyWith<$Res>(_value.loan, (value) {
      return _then(_value.copyWith(loan: value));
    });
  }
}

/// @nodoc
abstract class _$LoanFormStateCopyWith<$Res>
    implements $LoanFormStateCopyWith<$Res> {
  factory _$LoanFormStateCopyWith(
          _LoanFormState value, $Res Function(_LoanFormState) then) =
      __$LoanFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Loan loan,
      bool canSubmit,
      bool isSaving,
      bool isSuccess,
      String? errorText});

  @override
  $LoanCopyWith<$Res> get loan;
}

/// @nodoc
class __$LoanFormStateCopyWithImpl<$Res>
    extends _$LoanFormStateCopyWithImpl<$Res>
    implements _$LoanFormStateCopyWith<$Res> {
  __$LoanFormStateCopyWithImpl(
      _LoanFormState _value, $Res Function(_LoanFormState) _then)
      : super(_value, (v) => _then(v as _LoanFormState));

  @override
  _LoanFormState get _value => super._value as _LoanFormState;

  @override
  $Res call({
    Object? loan = freezed,
    Object? canSubmit = freezed,
    Object? isSaving = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_LoanFormState(
      loan: loan == freezed
          ? _value.loan
          : loan // ignore: cast_nullable_to_non_nullable
              as Loan,
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

class _$_LoanFormState implements _LoanFormState {
  const _$_LoanFormState(
      {required this.loan,
      this.canSubmit = false,
      this.isSaving = false,
      this.isSuccess = false,
      this.errorText});

  @override
  final Loan loan;
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
    return 'LoanFormState(loan: $loan, canSubmit: $canSubmit, isSaving: $isSaving, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoanFormState &&
            (identical(other.loan, loan) || other.loan == loan) &&
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
  int get hashCode =>
      Object.hash(runtimeType, loan, canSubmit, isSaving, isSuccess, errorText);

  @JsonKey(ignore: true)
  @override
  _$LoanFormStateCopyWith<_LoanFormState> get copyWith =>
      __$LoanFormStateCopyWithImpl<_LoanFormState>(this, _$identity);
}

abstract class _LoanFormState implements LoanFormState {
  const factory _LoanFormState(
      {required Loan loan,
      bool canSubmit,
      bool isSaving,
      bool isSuccess,
      String? errorText}) = _$_LoanFormState;

  @override
  Loan get loan;
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
  _$LoanFormStateCopyWith<_LoanFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
