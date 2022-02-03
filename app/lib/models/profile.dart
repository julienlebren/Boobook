import 'package:extensions/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

abstract class BaseProfile {
  String? id;
  String? firstName;
  String? lastName;
}

@freezed
class Profile extends BaseProfile with _$Profile {
  Profile._();

  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  factory Profile({
    String? id,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    String? country,
    String? lang,
    @Default(14) int loanTime,
    @Default(true) bool useMemberCards,
    @Default(3) int maxSimultaneousLoans,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  factory Profile.fromMap(Map<String, dynamic> data, String id) {
    return Profile.fromJson(data).copyWith(id: id);
  }
  String get displayName {
    if (firstName != "" && lastName != "") {
      return "$firstName $lastName";
    } else if (lastName != "") {
      return lastName!;
    } else if (firstName != "") {
      return firstName!;
    } else {
      return "";
    }
  }

  String get initials => displayName.initials;
}
