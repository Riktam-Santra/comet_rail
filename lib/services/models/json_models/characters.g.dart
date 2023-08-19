// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      json['id'] as String,
      json['name'] as String,
      json['tag'] as String,
      json['rarity'] as int,
      json['path'] as String,
      json['element'] as String,
      (json['max_sp'] as num).toDouble(),
      (json['ranks'] as List<dynamic>).map((e) => e as String).toList(),
      (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      (json['skill_trees'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['icon'] as String,
      json['preview'] as String,
      json['portrait'] as String,
      (json['guide_overview'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['guide_material'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tag': instance.tag,
      'rarity': instance.rarity,
      'path': instance.path,
      'element': instance.element,
      'max_sp': instance.maxSp,
      'ranks': instance.ranks,
      'skills': instance.skills,
      'skill_trees': instance.skillTrees,
      'icon': instance.icon,
      'preview': instance.preview,
      'portrait': instance.portrait,
      'guide_overview': instance.guideOverview,
      'guide_material': instance.guideMaterial,
    };
