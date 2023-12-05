// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      tier: json['tier'] as String?,
      playgroundId: json['playgroundId'] as int?,
      isActive: json['isActive'] as bool?,
      tel: json['tel'] as String?,
      startYear: json['startYear'] as int?,
      teamId: json['teamId'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'tier': instance.tier,
      'playgroundId': instance.playgroundId,
      'isActive': instance.isActive,
      'tel': instance.tel,
      'startYear': instance.startYear,
      'teamId': instance.teamId,
    };
