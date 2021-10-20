// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingsEventTearOff {
  const _$SettingsEventTearOff();

  _CardTitleChanged cardTitleChanged(String cardTitle) {
    return _CardTitleChanged(
      cardTitle,
    );
  }

  MaxSimultaneousLoansChanged maxSimultaneousLoansChanged(
      int maxSimultaneousLoans) {
    return MaxSimultaneousLoansChanged(
      maxSimultaneousLoans,
    );
  }

  _LoanDurationChanged loanDurationChanged(int loanDuration) {
    return _LoanDurationChanged(
      loanDuration,
    );
  }

  _LangChanged langChanged(String lang) {
    return _LangChanged(
      lang,
    );
  }

  _ThemeChanged themeChanged(ThemeType theme) {
    return _ThemeChanged(
      theme,
    );
  }
}

/// @nodoc
const $SettingsEvent = _$SettingsEventTearOff();

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTitle) cardTitleChanged,
    required TResult Function(int maxSimultaneousLoans)
        maxSimultaneousLoansChanged,
    required TResult Function(int loanDuration) loanDurationChanged,
    required TResult Function(String lang) langChanged,
    required TResult Function(ThemeType theme) themeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardTitleChanged value) cardTitleChanged,
    required TResult Function(MaxSimultaneousLoansChanged value)
        maxSimultaneousLoansChanged,
    required TResult Function(_LoanDurationChanged value) loanDurationChanged,
    required TResult Function(_LangChanged value) langChanged,
    required TResult Function(_ThemeChanged value) themeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;
}

/// @nodoc
abstract class _$CardTitleChangedCopyWith<$Res> {
  factory _$CardTitleChangedCopyWith(
          _CardTitleChanged value, $Res Function(_CardTitleChanged) then) =
      __$CardTitleChangedCopyWithImpl<$Res>;
  $Res call({String cardTitle});
}

/// @nodoc
class __$CardTitleChangedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$CardTitleChangedCopyWith<$Res> {
  __$CardTitleChangedCopyWithImpl(
      _CardTitleChanged _value, $Res Function(_CardTitleChanged) _then)
      : super(_value, (v) => _then(v as _CardTitleChanged));

  @override
  _CardTitleChanged get _value => super._value as _CardTitleChanged;

  @override
  $Res call({
    Object? cardTitle = freezed,
  }) {
    return _then(_CardTitleChanged(
      cardTitle == freezed
          ? _value.cardTitle
          : cardTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CardTitleChanged implements _CardTitleChanged {
  const _$_CardTitleChanged(this.cardTitle);

  @override
  final String cardTitle;

  @override
  String toString() {
    return 'SettingsEvent.cardTitleChanged(cardTitle: $cardTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CardTitleChanged &&
            (identical(other.cardTitle, cardTitle) ||
                other.cardTitle == cardTitle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cardTitle);

  @JsonKey(ignore: true)
  @override
  _$CardTitleChangedCopyWith<_CardTitleChanged> get copyWith =>
      __$CardTitleChangedCopyWithImpl<_CardTitleChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTitle) cardTitleChanged,
    required TResult Function(int maxSimultaneousLoans)
        maxSimultaneousLoansChanged,
    required TResult Function(int loanDuration) loanDurationChanged,
    required TResult Function(String lang) langChanged,
    required TResult Function(ThemeType theme) themeChanged,
  }) {
    return cardTitleChanged(cardTitle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
  }) {
    return cardTitleChanged?.call(cardTitle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
    required TResult orElse(),
  }) {
    if (cardTitleChanged != null) {
      return cardTitleChanged(cardTitle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardTitleChanged value) cardTitleChanged,
    required TResult Function(MaxSimultaneousLoansChanged value)
        maxSimultaneousLoansChanged,
    required TResult Function(_LoanDurationChanged value) loanDurationChanged,
    required TResult Function(_LangChanged value) langChanged,
    required TResult Function(_ThemeChanged value) themeChanged,
  }) {
    return cardTitleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
  }) {
    return cardTitleChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
    required TResult orElse(),
  }) {
    if (cardTitleChanged != null) {
      return cardTitleChanged(this);
    }
    return orElse();
  }
}

abstract class _CardTitleChanged implements SettingsEvent {
  const factory _CardTitleChanged(String cardTitle) = _$_CardTitleChanged;

  String get cardTitle;
  @JsonKey(ignore: true)
  _$CardTitleChangedCopyWith<_CardTitleChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaxSimultaneousLoansChangedCopyWith<$Res> {
  factory $MaxSimultaneousLoansChangedCopyWith(
          MaxSimultaneousLoansChanged value,
          $Res Function(MaxSimultaneousLoansChanged) then) =
      _$MaxSimultaneousLoansChangedCopyWithImpl<$Res>;
  $Res call({int maxSimultaneousLoans});
}

/// @nodoc
class _$MaxSimultaneousLoansChangedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements $MaxSimultaneousLoansChangedCopyWith<$Res> {
  _$MaxSimultaneousLoansChangedCopyWithImpl(MaxSimultaneousLoansChanged _value,
      $Res Function(MaxSimultaneousLoansChanged) _then)
      : super(_value, (v) => _then(v as MaxSimultaneousLoansChanged));

  @override
  MaxSimultaneousLoansChanged get _value =>
      super._value as MaxSimultaneousLoansChanged;

  @override
  $Res call({
    Object? maxSimultaneousLoans = freezed,
  }) {
    return _then(MaxSimultaneousLoansChanged(
      maxSimultaneousLoans == freezed
          ? _value.maxSimultaneousLoans
          : maxSimultaneousLoans // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MaxSimultaneousLoansChanged implements MaxSimultaneousLoansChanged {
  const _$MaxSimultaneousLoansChanged(this.maxSimultaneousLoans);

  @override
  final int maxSimultaneousLoans;

  @override
  String toString() {
    return 'SettingsEvent.maxSimultaneousLoansChanged(maxSimultaneousLoans: $maxSimultaneousLoans)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MaxSimultaneousLoansChanged &&
            (identical(other.maxSimultaneousLoans, maxSimultaneousLoans) ||
                other.maxSimultaneousLoans == maxSimultaneousLoans));
  }

  @override
  int get hashCode => Object.hash(runtimeType, maxSimultaneousLoans);

  @JsonKey(ignore: true)
  @override
  $MaxSimultaneousLoansChangedCopyWith<MaxSimultaneousLoansChanged>
      get copyWith => _$MaxSimultaneousLoansChangedCopyWithImpl<
          MaxSimultaneousLoansChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTitle) cardTitleChanged,
    required TResult Function(int maxSimultaneousLoans)
        maxSimultaneousLoansChanged,
    required TResult Function(int loanDuration) loanDurationChanged,
    required TResult Function(String lang) langChanged,
    required TResult Function(ThemeType theme) themeChanged,
  }) {
    return maxSimultaneousLoansChanged(maxSimultaneousLoans);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
  }) {
    return maxSimultaneousLoansChanged?.call(maxSimultaneousLoans);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
    required TResult orElse(),
  }) {
    if (maxSimultaneousLoansChanged != null) {
      return maxSimultaneousLoansChanged(maxSimultaneousLoans);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardTitleChanged value) cardTitleChanged,
    required TResult Function(MaxSimultaneousLoansChanged value)
        maxSimultaneousLoansChanged,
    required TResult Function(_LoanDurationChanged value) loanDurationChanged,
    required TResult Function(_LangChanged value) langChanged,
    required TResult Function(_ThemeChanged value) themeChanged,
  }) {
    return maxSimultaneousLoansChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
  }) {
    return maxSimultaneousLoansChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
    required TResult orElse(),
  }) {
    if (maxSimultaneousLoansChanged != null) {
      return maxSimultaneousLoansChanged(this);
    }
    return orElse();
  }
}

abstract class MaxSimultaneousLoansChanged implements SettingsEvent {
  const factory MaxSimultaneousLoansChanged(int maxSimultaneousLoans) =
      _$MaxSimultaneousLoansChanged;

  int get maxSimultaneousLoans;
  @JsonKey(ignore: true)
  $MaxSimultaneousLoansChangedCopyWith<MaxSimultaneousLoansChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoanDurationChangedCopyWith<$Res> {
  factory _$LoanDurationChangedCopyWith(_LoanDurationChanged value,
          $Res Function(_LoanDurationChanged) then) =
      __$LoanDurationChangedCopyWithImpl<$Res>;
  $Res call({int loanDuration});
}

/// @nodoc
class __$LoanDurationChangedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$LoanDurationChangedCopyWith<$Res> {
  __$LoanDurationChangedCopyWithImpl(
      _LoanDurationChanged _value, $Res Function(_LoanDurationChanged) _then)
      : super(_value, (v) => _then(v as _LoanDurationChanged));

  @override
  _LoanDurationChanged get _value => super._value as _LoanDurationChanged;

  @override
  $Res call({
    Object? loanDuration = freezed,
  }) {
    return _then(_LoanDurationChanged(
      loanDuration == freezed
          ? _value.loanDuration
          : loanDuration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoanDurationChanged implements _LoanDurationChanged {
  const _$_LoanDurationChanged(this.loanDuration);

  @override
  final int loanDuration;

  @override
  String toString() {
    return 'SettingsEvent.loanDurationChanged(loanDuration: $loanDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoanDurationChanged &&
            (identical(other.loanDuration, loanDuration) ||
                other.loanDuration == loanDuration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loanDuration);

  @JsonKey(ignore: true)
  @override
  _$LoanDurationChangedCopyWith<_LoanDurationChanged> get copyWith =>
      __$LoanDurationChangedCopyWithImpl<_LoanDurationChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTitle) cardTitleChanged,
    required TResult Function(int maxSimultaneousLoans)
        maxSimultaneousLoansChanged,
    required TResult Function(int loanDuration) loanDurationChanged,
    required TResult Function(String lang) langChanged,
    required TResult Function(ThemeType theme) themeChanged,
  }) {
    return loanDurationChanged(loanDuration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
  }) {
    return loanDurationChanged?.call(loanDuration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
    required TResult orElse(),
  }) {
    if (loanDurationChanged != null) {
      return loanDurationChanged(loanDuration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardTitleChanged value) cardTitleChanged,
    required TResult Function(MaxSimultaneousLoansChanged value)
        maxSimultaneousLoansChanged,
    required TResult Function(_LoanDurationChanged value) loanDurationChanged,
    required TResult Function(_LangChanged value) langChanged,
    required TResult Function(_ThemeChanged value) themeChanged,
  }) {
    return loanDurationChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
  }) {
    return loanDurationChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
    required TResult orElse(),
  }) {
    if (loanDurationChanged != null) {
      return loanDurationChanged(this);
    }
    return orElse();
  }
}

abstract class _LoanDurationChanged implements SettingsEvent {
  const factory _LoanDurationChanged(int loanDuration) = _$_LoanDurationChanged;

  int get loanDuration;
  @JsonKey(ignore: true)
  _$LoanDurationChangedCopyWith<_LoanDurationChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LangChangedCopyWith<$Res> {
  factory _$LangChangedCopyWith(
          _LangChanged value, $Res Function(_LangChanged) then) =
      __$LangChangedCopyWithImpl<$Res>;
  $Res call({String lang});
}

/// @nodoc
class __$LangChangedCopyWithImpl<$Res> extends _$SettingsEventCopyWithImpl<$Res>
    implements _$LangChangedCopyWith<$Res> {
  __$LangChangedCopyWithImpl(
      _LangChanged _value, $Res Function(_LangChanged) _then)
      : super(_value, (v) => _then(v as _LangChanged));

  @override
  _LangChanged get _value => super._value as _LangChanged;

  @override
  $Res call({
    Object? lang = freezed,
  }) {
    return _then(_LangChanged(
      lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LangChanged implements _LangChanged {
  const _$_LangChanged(this.lang);

  @override
  final String lang;

  @override
  String toString() {
    return 'SettingsEvent.langChanged(lang: $lang)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LangChanged &&
            (identical(other.lang, lang) || other.lang == lang));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lang);

  @JsonKey(ignore: true)
  @override
  _$LangChangedCopyWith<_LangChanged> get copyWith =>
      __$LangChangedCopyWithImpl<_LangChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTitle) cardTitleChanged,
    required TResult Function(int maxSimultaneousLoans)
        maxSimultaneousLoansChanged,
    required TResult Function(int loanDuration) loanDurationChanged,
    required TResult Function(String lang) langChanged,
    required TResult Function(ThemeType theme) themeChanged,
  }) {
    return langChanged(lang);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
  }) {
    return langChanged?.call(lang);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
    required TResult orElse(),
  }) {
    if (langChanged != null) {
      return langChanged(lang);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardTitleChanged value) cardTitleChanged,
    required TResult Function(MaxSimultaneousLoansChanged value)
        maxSimultaneousLoansChanged,
    required TResult Function(_LoanDurationChanged value) loanDurationChanged,
    required TResult Function(_LangChanged value) langChanged,
    required TResult Function(_ThemeChanged value) themeChanged,
  }) {
    return langChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
  }) {
    return langChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
    required TResult orElse(),
  }) {
    if (langChanged != null) {
      return langChanged(this);
    }
    return orElse();
  }
}

abstract class _LangChanged implements SettingsEvent {
  const factory _LangChanged(String lang) = _$_LangChanged;

  String get lang;
  @JsonKey(ignore: true)
  _$LangChangedCopyWith<_LangChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ThemeChangedCopyWith<$Res> {
  factory _$ThemeChangedCopyWith(
          _ThemeChanged value, $Res Function(_ThemeChanged) then) =
      __$ThemeChangedCopyWithImpl<$Res>;
  $Res call({ThemeType theme});
}

/// @nodoc
class __$ThemeChangedCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$ThemeChangedCopyWith<$Res> {
  __$ThemeChangedCopyWithImpl(
      _ThemeChanged _value, $Res Function(_ThemeChanged) _then)
      : super(_value, (v) => _then(v as _ThemeChanged));

  @override
  _ThemeChanged get _value => super._value as _ThemeChanged;

  @override
  $Res call({
    Object? theme = freezed,
  }) {
    return _then(_ThemeChanged(
      theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeType,
    ));
  }
}

/// @nodoc

class _$_ThemeChanged implements _ThemeChanged {
  const _$_ThemeChanged(this.theme);

  @override
  final ThemeType theme;

  @override
  String toString() {
    return 'SettingsEvent.themeChanged(theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ThemeChanged &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, theme);

  @JsonKey(ignore: true)
  @override
  _$ThemeChangedCopyWith<_ThemeChanged> get copyWith =>
      __$ThemeChangedCopyWithImpl<_ThemeChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cardTitle) cardTitleChanged,
    required TResult Function(int maxSimultaneousLoans)
        maxSimultaneousLoansChanged,
    required TResult Function(int loanDuration) loanDurationChanged,
    required TResult Function(String lang) langChanged,
    required TResult Function(ThemeType theme) themeChanged,
  }) {
    return themeChanged(theme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
  }) {
    return themeChanged?.call(theme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cardTitle)? cardTitleChanged,
    TResult Function(int maxSimultaneousLoans)? maxSimultaneousLoansChanged,
    TResult Function(int loanDuration)? loanDurationChanged,
    TResult Function(String lang)? langChanged,
    TResult Function(ThemeType theme)? themeChanged,
    required TResult orElse(),
  }) {
    if (themeChanged != null) {
      return themeChanged(theme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardTitleChanged value) cardTitleChanged,
    required TResult Function(MaxSimultaneousLoansChanged value)
        maxSimultaneousLoansChanged,
    required TResult Function(_LoanDurationChanged value) loanDurationChanged,
    required TResult Function(_LangChanged value) langChanged,
    required TResult Function(_ThemeChanged value) themeChanged,
  }) {
    return themeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
  }) {
    return themeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardTitleChanged value)? cardTitleChanged,
    TResult Function(MaxSimultaneousLoansChanged value)?
        maxSimultaneousLoansChanged,
    TResult Function(_LoanDurationChanged value)? loanDurationChanged,
    TResult Function(_LangChanged value)? langChanged,
    TResult Function(_ThemeChanged value)? themeChanged,
    required TResult orElse(),
  }) {
    if (themeChanged != null) {
      return themeChanged(this);
    }
    return orElse();
  }
}

abstract class _ThemeChanged implements SettingsEvent {
  const factory _ThemeChanged(ThemeType theme) = _$_ThemeChanged;

  ThemeType get theme;
  @JsonKey(ignore: true)
  _$ThemeChangedCopyWith<_ThemeChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Saving saving() {
    return const _Saving();
  }

  _Error error(String errorText) {
    return _Error(
      errorText,
    );
  }

  _Success success() {
    return const _Success();
  }
}

/// @nodoc
const $SettingsState = _$SettingsStateTearOff();

/// @nodoc
mixin _$SettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(String errorText) error,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SettingsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(String errorText) error,
    required TResult Function() success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SettingsState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$SavingCopyWith<$Res> {
  factory _$SavingCopyWith(_Saving value, $Res Function(_Saving) then) =
      __$SavingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavingCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$SavingCopyWith<$Res> {
  __$SavingCopyWithImpl(_Saving _value, $Res Function(_Saving) _then)
      : super(_value, (v) => _then(v as _Saving));

  @override
  _Saving get _value => super._value as _Saving;
}

/// @nodoc

class _$_Saving implements _Saving {
  const _$_Saving();

  @override
  String toString() {
    return 'SettingsState.saving()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Saving);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(String errorText) error,
    required TResult Function() success,
  }) {
    return saving();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
  }) {
    return saving?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class _Saving implements SettingsState {
  const factory _Saving() = _$_Saving;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String errorText});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_Error(
      errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.errorText);

  @override
  final String errorText;

  @override
  String toString() {
    return 'SettingsState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorText);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(String errorText) error,
    required TResult Function() success,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SettingsState {
  const factory _Error(String errorText) = _$_Error;

  String get errorText;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success();

  @override
  String toString() {
    return 'SettingsState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(String errorText) error,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(String errorText)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SettingsState {
  const factory _Success() = _$_Success;
}
