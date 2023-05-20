// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_cone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LightCone _$LightConeFromJson(Map<String, dynamic> json) => LightCone(
      json['id'] as String,
      json['name'] as String,
      json['rarity'] as int,
      json['path'] as String,
      json['icon'] as String,
      (json['guide_overview'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LightConeToJson(LightCone instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rarity': instance.rarity,
      'path': instance.path,
      'icon': instance.icon,
      'guide_overview': instance.guideOverview,
    };
