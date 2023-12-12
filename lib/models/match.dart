import 'package:json_annotation/json_annotation.dart';

part 'match.g.dart';

@JsonSerializable()
class Match { 
  int? id;
  int? player1;
  int? player2;
  int? player1Score;
  int? player2Score;
  int? playgroundId;
  DateTime? createdAt;

  Match({
    this.id,
    this.player1,
    this.player2,
    this.player1Score,
    this.player2Score,
    this.playgroundId,
    this.createdAt,
  });

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
  Map<String, dynamic> toJson() => _$MatchToJson(this);
}
