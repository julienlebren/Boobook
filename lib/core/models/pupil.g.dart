// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pupil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pupil _$$_PupilFromJson(Map<String, dynamic> json) => _$_Pupil(
      id: json['id'] as String?,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      photoUrl: json['photoUrl'] as String?,
      isNewPupil: json['isNewPupil'] as bool?,
      color: json['color'] as int? ?? 1,
      currentLoans: json['currentLoans'] as int? ?? 0,
      totalLoans: json['totalLoans'] as int? ?? 0,
      isArchived: json['isArchived'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PupilToJson(_$_Pupil instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['firstName'] = instance.firstName;
  val['lastName'] = instance.lastName;
  writeNotNull('photoUrl', instance.photoUrl);
  writeNotNull('isNewPupil', instance.isNewPupil);
  val['color'] = instance.color;
  val['currentLoans'] = instance.currentLoans;
  val['totalLoans'] = instance.totalLoans;
  val['isArchived'] = instance.isArchived;
  return val;
}
