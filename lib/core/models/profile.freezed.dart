// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
class _$ProfileTearOff {
  const _$ProfileTearOff();

  _Profile call(
      {String? id,
      String? firstName,
      String? lastName,
      required String phoneNumber,
      String? country,
      String? lang,
      int loanTime = 14,
      bool useMemberCards = true,
      int maxSimultaneousLoans = 3}) {
    return _Profile(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      country: country,
      lang: lang,
      loanTime: loanTime,
      useMemberCards: useMemberCards,
      maxSimultaneousLoans: maxSimultaneousLoans,
    );
  }

  Profile fromJson(Map<String, Object?> json) {
    return Profile.fromJson(json);
  }
}

/// @nodoc
const $Profile = _$ProfileTearOff();

/// @nodoc
mixin _$Profile {
  String? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  int get loanTime => throw _privateConstructorUsedError;
  bool get useMemberCards => throw _privateConstructorUsedError;
  int get maxSimultaneousLoans => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String phoneNumber,
      String? country,
      String? lang,
      int loanTime,
      bool useMemberCards,
      int maxSimultaneousLoans});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  final Profile _value;
  // ignore: unused_field
  final $Res Function(Profile) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? country = freezed,
    Object? lang = freezed,
    Object? loanTime = freezed,
    Object? useMemberCards = freezed,
    Object? maxSimultaneousLoans = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      loanTime: loanTime == freezed
          ? _value.loanTime
          : loanTime // ignore: cast_nullable_to_non_nullable
              as int,
      useMemberCards: useMemberCards == freezed
          ? _value.useMemberCards
          : useMemberCards // ignore: cast_nullable_to_non_nullable
              as bool,
      maxSimultaneousLoans: maxSimultaneousLoans == freezed
          ? _value.maxSimultaneousLoans
          : maxSimultaneousLoans // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) then) =
      __$ProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String phoneNumber,
      String? country,
      String? lang,
      int loanTime,
      bool useMemberCards,
      int maxSimultaneousLoans});
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> extends _$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(_Profile _value, $Res Function(_Profile) _then)
      : super(_value, (v) => _then(v as _Profile));

  @override
  _Profile get _value => super._value as _Profile;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? country = freezed,
    Object? lang = freezed,
    Object? loanTime = freezed,
    Object? useMemberCards = freezed,
    Object? maxSimultaneousLoans = freezed,
  }) {
    return _then(_Profile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      loanTime: loanTime == freezed
          ? _value.loanTime
          : loanTime // ignore: cast_nullable_to_non_nullable
              as int,
      useMemberCards: useMemberCards == freezed
          ? _value.useMemberCards
          : useMemberCards // ignore: cast_nullable_to_non_nullable
              as bool,
      maxSimultaneousLoans: maxSimultaneousLoans == freezed
          ? _value.maxSimultaneousLoans
          : maxSimultaneousLoans // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_Profile extends _Profile {
  _$_Profile(
      {this.id,
      this.firstName,
      this.lastName,
      required this.phoneNumber,
      this.country,
      this.lang,
      this.loanTime = 14,
      this.useMemberCards = true,
      this.maxSimultaneousLoans = 3})
      : super._();

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String phoneNumber;
  @override
  final String? country;
  @override
  final String? lang;
  @JsonKey(defaultValue: 14)
  @override
  final int loanTime;
  @JsonKey(defaultValue: true)
  @override
  final bool useMemberCards;
  @JsonKey(defaultValue: 3)
  @override
  final int maxSimultaneousLoans;

  @override
  String toString() {
    return 'Profile(id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, country: $country, lang: $lang, loanTime: $loanTime, useMemberCards: $useMemberCards, maxSimultaneousLoans: $maxSimultaneousLoans)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.loanTime, loanTime) ||
                other.loanTime == loanTime) &&
            (identical(other.useMemberCards, useMemberCards) ||
                other.useMemberCards == useMemberCards) &&
            (identical(other.maxSimultaneousLoans, maxSimultaneousLoans) ||
                other.maxSimultaneousLoans == maxSimultaneousLoans));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      phoneNumber,
      country,
      lang,
      loanTime,
      useMemberCards,
      maxSimultaneousLoans);

  @JsonKey(ignore: true)
  @override
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(this);
  }
}

abstract class _Profile extends Profile {
  factory _Profile(
      {String? id,
      String? firstName,
      String? lastName,
      required String phoneNumber,
      String? country,
      String? lang,
      int loanTime,
      bool useMemberCards,
      int maxSimultaneousLoans}) = _$_Profile;
  _Profile._() : super._();

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  String? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String get phoneNumber;
  @override
  String? get country;
  @override
  String? get lang;
  @override
  int get loanTime;
  @override
  bool get useMemberCards;
  @override
  int get maxSimultaneousLoans;
  @override
  @JsonKey(ignore: true)
  _$ProfileCopyWith<_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
