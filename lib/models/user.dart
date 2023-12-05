import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? email;
  String? name;
  String? tier;
  int? playgroundId;
  bool? isActive;
  String? tel;
  int? startYear;
  int? teamId;

  User({
    this.id,
    this.email,
    this.name,
    this.tier,
    this.playgroundId,
    this.isActive,
    this.tel,
    this.startYear,
    this.teamId,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
