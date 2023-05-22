// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relic_desc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelicDesc _$RelicDescFromJson(Map<String, dynamic> json) => RelicDesc(
      json['name'] as String,
      (json['skills'] as List<dynamic>)
          .map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['pieces'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Piece.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$RelicDescToJson(RelicDesc instance) => <String, dynamic>{
      'name': instance.name,
      'skills': instance.skills,
      'pieces': instance.pieces,
    };

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
      json['useNum'] as int,
      json['desc'] as String,
      (json['params'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'useNum': instance.useNum,
      'desc': instance.desc,
      'params': instance.params,
    };

Piece _$PieceFromJson(Map<String, dynamic> json) => Piece(
      json['name'] as String,
      json['maxRarity'] as int,
      json['loreTitle'] as String,
      json['miniLore'] as String,
      json['lore'] as String,
    );

Map<String, dynamic> _$PieceToJson(Piece instance) => <String, dynamic>{
      'name': instance.name,
      'maxRarity': instance.maxRarity,
      'loreTitle': instance.loreTitle,
      'miniLore': instance.miniLore,
      'lore': instance.lore,
    };
