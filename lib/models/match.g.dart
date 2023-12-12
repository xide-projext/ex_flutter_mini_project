// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
      id: json['id'] as int?,
      player1: json['player1'] as int?,
      player2: json['player2'] as int?,
      player1Score: json['player1Score'] as int?,
      player2Score: json['player2Score'] as int?,
      playgroundId: json['playgroundId'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'id': instance.id,
      'player1': instance.player1,
      'player2': instance.player2,
      'player1Score': instance.player1Score,
      'player2Score': instance.player2Score,
      'playgroundId': instance.playgroundId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
