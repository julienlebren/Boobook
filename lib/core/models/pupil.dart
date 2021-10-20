import 'package:avatar/avatar.dart';
import 'package:extensions/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pupil.freezed.dart';
part 'pupil.g.dart';

@freezed
class Pupil with _$Pupil {
  const Pupil._();

  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  factory Pupil({
    String? id,
    @Default("") String firstName,
    @Default("") String lastName,
    String? photoUrl,
    bool? isNewPupil,
    @Default(1) int color,
    @Default(0) int currentLoans,
    @Default(0) int totalLoans,
    @Default(false) bool isArchived,
  }) = _Pupil;

  factory Pupil.fromJson(Map<String, dynamic> json) => _$PupilFromJson(json);

  factory Pupil.fromMap(Map<String, dynamic> data, String id) {
    final pupilFromJson = Pupil.fromJson(data);
    return pupilFromJson.copyWith(id: id);
  }

  factory Pupil.create({
    required String id,
  }) =>
      Pupil(
        id: id,
        color: AvatarColors.random,
        isNewPupil: true,
      );

  String get displayName {
    if (firstName != "" && lastName != "") {
      return "$firstName $lastName";
    } else if (lastName != "") {
      return lastName;
    } else if (firstName != "") {
      return firstName;
    } else {
      return "";
    }
  }

  String get initials => displayName.initials;
}
