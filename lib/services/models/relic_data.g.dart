// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relic_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelicData _$RelicDataFromJson(Map<String, dynamic> json) => RelicData(
      json['id'] as String,
      json['set_id'] as String,
      json['name'] as String,
      json['rarity'] as int,
      json['type'] as String,
      json['max_level'] as int,
      json['main_affix_id'] as String,
      json['sub_affix_id'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$RelicDataToJson(RelicData instance) => <String, dynamic>{
      'id': instance.id,
      'set_id': instance.setId,
      'name': instance.name,
      'rarity': instance.rarity,
      'type': instance.type,
      'max_level': instance.maxLevel,
      'main_affix_id': instance.mainAffixId,
      'sub_affix_id': instance.subAffixId,
      'icon': instance.icon,
    };
