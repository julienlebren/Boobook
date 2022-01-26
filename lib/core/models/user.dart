import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_service/firestore_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layout_builder/theme/theme.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory User({
    String? id,
    String? displayName,
    String? lastname,
    String? firstName,
    String? emailAddress,
    String? country,
    String? lang,
    String? cardTitle,
    @Default(false) bool isSubscribed,
    @Default(false) bool emailVerified,
    @Default(14) int loanDuration,
    @Default(true) bool useMemberCards,
    @Default(2) int maxSimultaneousLoans,
    @NullableTimestampConverter() DateTime? subscriptionEndTime,
    @ThemeTypeConverter() required ThemeType theme,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
