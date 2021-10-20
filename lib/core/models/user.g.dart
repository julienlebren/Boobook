// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      displayName: json['displayName'] as String?,
      lastname: json['lastname'] as String?,
      firstName: json['firstName'] as String?,
      emailAddress: json['emailAddress'] as String?,
      country: json['country'] as String?,
      lang: json['lang'] as String?,
      cardTitle: json['cardTitle'] as String?,
      isSubscribed: json['isSubscribed'] as bool? ?? false,
      emailVerified: json['emailVerified'] as bool? ?? false,
      loanDuration: json['loanDuration'] as int? ?? 14,
      useMemberCards: json['useMemberCards'] as bool? ?? true,
      maxSimultaneousLoans: json['maxSimultaneousLoans'] as int? ?? 2,
      subscriptionEndTime: const NullableTimestampConverter()
          .fromJson(json['subscriptionEndTime'] as Timestamp?),
      theme: const ThemeTypeConverter().fromJson(json['theme'] as int),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('displayName', instance.displayName);
  writeNotNull('lastname', instance.lastname);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('emailAddress', instance.emailAddress);
  writeNotNull('country', instance.country);
  writeNotNull('lang', instance.lang);
  writeNotNull('cardTitle', instance.cardTitle);
  val['isSubscribed'] = instance.isSubscribed;
  val['emailVerified'] = instance.emailVerified;
  val['loanDuration'] = instance.loanDuration;
  val['useMemberCards'] = instance.useMemberCards;
  val['maxSimultaneousLoans'] = instance.maxSimultaneousLoans;
  writeNotNull('subscriptionEndTime',
      const NullableTimestampConverter().toJson(instance.subscriptionEndTime));
  writeNotNull('theme', const ThemeTypeConverter().toJson(instance.theme));
  return val;
}
