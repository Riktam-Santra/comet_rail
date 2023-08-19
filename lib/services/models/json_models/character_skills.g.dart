// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_skills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterSkill _$CharacterSkillFromJson(Map<String, dynamic> json) =>
    CharacterSkill(
      json['id'] as String,
      json['name'] as String,
      json['max_level'] as int,
      json['element'] as String,
      json['type'] as String,
      json['text_type'] as String?,
      json['effect'] as String,
      json['effect_type'] as String?,
      json['simple_desc'] as String,
      json['desc'] as String,
      (json['params'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      json['icon'] as String,
    );

Map<String, dynamic> _$CharacterSkillToJson(CharacterSkill instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'max_level': instance.maxLevel,
      'element': instance.element,
      'type': instance.type,
      'text_type': instance.textType,
      'effect': instance.effect,
      'effect_type': instance.effectType,
      'simple_desc': instance.simpleDesc,
      'desc': instance.desc,
      'params': instance.params,
      'icon': instance.icon,
    };
