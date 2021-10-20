// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {String? id,
      String? displayName,
      String? lastname,
      String? firstName,
      String? emailAddress,
      String? country,
      String? lang,
      String? cardTitle,
      bool isSubscribed = false,
      bool emailVerified = false,
      int loanDuration = 14,
      bool useMemberCards = true,
      int maxSimultaneousLoans = 2,
      @NullableTimestampConverter() DateTime? subscriptionEndTime,
      @ThemeTypeConverter() required ThemeType theme}) {
    return _User(
      id: id,
      displayName: displayName,
      lastname: lastname,
      firstName: firstName,
      emailAddress: emailAddress,
      country: country,
      lang: lang,
      cardTitle: cardTitle,
      isSubscribed: isSubscribed,
      emailVerified: emailVerified,
      loanDuration: loanDuration,
      useMemberCards: useMemberCards,
      maxSimultaneousLoans: maxSimultaneousLoans,
      subscriptionEndTime: subscriptionEndTime,
      theme: theme,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get emailAddress => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String? get cardTitle => throw _privateConstructorUsedError;
  bool get isSubscribed => throw _privateConstructorUsedError;
  bool get emailVerified => throw _privateConstructorUsedError;
  int get loanDuration => throw _privateConstructorUsedError;
  bool get useMemberCards => throw _privateConstructorUsedError;
  int get maxSimultaneousLoans => throw _privateConstructorUsedError;
  @NullableTimestampConverter()
  DateTime? get subscriptionEndTime => throw _privateConstructorUsedError;
  @ThemeTypeConverter()
  ThemeType get theme => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? displayName,
      String? lastname,
      String? firstName,
      String? emailAddress,
      String? country,
      String? lang,
      String? cardTitle,
      bool isSubscribed,
      bool emailVerified,
      int loanDuration,
      bool useMemberCards,
      int maxSimultaneousLoans,
      @NullableTimestampConverter() DateTime? subscriptionEndTime,
      @ThemeTypeConverter() ThemeType theme});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? lastname = freezed,
    Object? firstName = freezed,
    Object? emailAddress = freezed,
    Object? country = freezed,
    Object? lang = freezed,
    Object? cardTitle = freezed,
    Object? isSubscribed = freezed,
    Object? emailVerified = freezed,
    Object? loanDuration = freezed,
    Object? useMemberCards = freezed,
    Object? maxSimultaneousLoans = freezed,
    Object? subscriptionEndTime = freezed,
    Object? theme = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      cardTitle: cardTitle == freezed
          ? _value.cardTitle
          : cardTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubscribed: isSubscribed == freezed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      loanDuration: loanDuration == freezed
          ? _value.loanDuration
          : loanDuration // ignore: cast_nullable_to_non_nullable
              as int,
      useMemberCards: useMemberCards == freezed
          ? _value.useMemberCards
          : useMemberCards // ignore: cast_nullable_to_non_nullable
              as bool,
      maxSimultaneousLoans: maxSimultaneousLoans == freezed
          ? _value.maxSimultaneousLoans
          : maxSimultaneousLoans // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptionEndTime: subscriptionEndTime == freezed
          ? _value.subscriptionEndTime
          : subscriptionEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeType,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? displayName,
      String? lastname,
      String? firstName,
      String? emailAddress,
      String? country,
      String? lang,
      String? cardTitle,
      bool isSubscribed,
      bool emailVerified,
      int loanDuration,
      bool useMemberCards,
      int maxSimultaneousLoans,
      @NullableTimestampConverter() DateTime? subscriptionEndTime,
      @ThemeTypeConverter() ThemeType theme});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? lastname = freezed,
    Object? firstName = freezed,
    Object? emailAddress = freezed,
    Object? country = freezed,
    Object? lang = freezed,
    Object? cardTitle = freezed,
    Object? isSubscribed = freezed,
    Object? emailVerified = freezed,
    Object? loanDuration = freezed,
    Object? useMemberCards = freezed,
    Object? maxSimultaneousLoans = freezed,
    Object? subscriptionEndTime = freezed,
    Object? theme = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: lastname == freezed
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      cardTitle: cardTitle == freezed
          ? _value.cardTitle
          : cardTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubscribed: isSubscribed == freezed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      loanDuration: loanDuration == freezed
          ? _value.loanDuration
          : loanDuration // ignore: cast_nullable_to_non_nullable
              as int,
      useMemberCards: useMemberCards == freezed
          ? _value.useMemberCards
          : useMemberCards // ignore: cast_nullable_to_non_nullable
              as bool,
      maxSimultaneousLoans: maxSimultaneousLoans == freezed
          ? _value.maxSimultaneousLoans
          : maxSimultaneousLoans // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptionEndTime: subscriptionEndTime == freezed
          ? _value.subscriptionEndTime
          : subscriptionEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeType,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_User implements _User {
  const _$_User(
      {this.id,
      this.displayName,
      this.lastname,
      this.firstName,
      this.emailAddress,
      this.country,
      this.lang,
      this.cardTitle,
      this.isSubscribed = false,
      this.emailVerified = false,
      this.loanDuration = 14,
      this.useMemberCards = true,
      this.maxSimultaneousLoans = 2,
      @NullableTimestampConverter() this.subscriptionEndTime,
      @ThemeTypeConverter() required this.theme});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? id;
  @override
  final String? displayName;
  @override
  final String? lastname;
  @override
  final String? firstName;
  @override
  final String? emailAddress;
  @override
  final String? country;
  @override
  final String? lang;
  @override
  final String? cardTitle;
  @JsonKey(defaultValue: false)
  @override
  final bool isSubscribed;
  @JsonKey(defaultValue: false)
  @override
  final bool emailVerified;
  @JsonKey(defaultValue: 14)
  @override
  final int loanDuration;
  @JsonKey(defaultValue: true)
  @override
  final bool useMemberCards;
  @JsonKey(defaultValue: 2)
  @override
  final int maxSimultaneousLoans;
  @override
  @NullableTimestampConverter()
  final DateTime? subscriptionEndTime;
  @override
  @ThemeTypeConverter()
  final ThemeType theme;

  @override
  String toString() {
    return 'User(id: $id, displayName: $displayName, lastname: $lastname, firstName: $firstName, emailAddress: $emailAddress, country: $country, lang: $lang, cardTitle: $cardTitle, isSubscribed: $isSubscribed, emailVerified: $emailVerified, loanDuration: $loanDuration, useMemberCards: $useMemberCards, maxSimultaneousLoans: $maxSimultaneousLoans, subscriptionEndTime: $subscriptionEndTime, theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.cardTitle, cardTitle) ||
                other.cardTitle == cardTitle) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.loanDuration, loanDuration) ||
                other.loanDuration == loanDuration) &&
            (identical(other.useMemberCards, useMemberCards) ||
                other.useMemberCards == useMemberCards) &&
            (identical(other.maxSimultaneousLoans, maxSimultaneousLoans) ||
                other.maxSimultaneousLoans == maxSimultaneousLoans) &&
            (identical(other.subscriptionEndTime, subscriptionEndTime) ||
                other.subscriptionEndTime == subscriptionEndTime) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      displayName,
      lastname,
      firstName,
      emailAddress,
      country,
      lang,
      cardTitle,
      isSubscribed,
      emailVerified,
      loanDuration,
      useMemberCards,
      maxSimultaneousLoans,
      subscriptionEndTime,
      theme);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {String? id,
      String? displayName,
      String? lastname,
      String? firstName,
      String? emailAddress,
      String? country,
      String? lang,
      String? cardTitle,
      bool isSubscribed,
      bool emailVerified,
      int loanDuration,
      bool useMemberCards,
      int maxSimultaneousLoans,
      @NullableTimestampConverter() DateTime? subscriptionEndTime,
      @ThemeTypeConverter() required ThemeType theme}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id;
  @override
  String? get displayName;
  @override
  String? get lastname;
  @override
  String? get firstName;
  @override
  String? get emailAddress;
  @override
  String? get country;
  @override
  String? get lang;
  @override
  String? get cardTitle;
  @override
  bool get isSubscribed;
  @override
  bool get emailVerified;
  @override
  int get loanDuration;
  @override
  bool get useMemberCards;
  @override
  int get maxSimultaneousLoans;
  @override
  @NullableTimestampConverter()
  DateTime? get subscriptionEndTime;
  @override
  @ThemeTypeConverter()
  ThemeType get theme;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
