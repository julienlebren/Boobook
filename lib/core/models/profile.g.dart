// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      country: json['country'] as String?,
      lang: json['lang'] as String?,
      loanTime: json['loanTime'] as int? ?? 14,
      useMemberCards: json['useMemberCards'] as bool? ?? true,
      maxSimultaneousLoans: json['maxSimultaneousLoans'] as int? ?? 3,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  val['phoneNumber'] = instance.phoneNumber;
  writeNotNull('country', instance.country);
  writeNotNull('lang', instance.lang);
  val['loanTime'] = instance.loanTime;
  val['useMemberCards'] = instance.useMemberCards;
  val['maxSimultaneousLoans'] = instance.maxSimultaneousLoans;
  return val;
}
