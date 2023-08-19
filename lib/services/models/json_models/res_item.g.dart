// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResItem _$ResItemFromJson(Map<String, dynamic> json) => ResItem(
      json['id'] as String,
      json['name'] as String,
      json['sub_type'] as String,
      json['rarity'] as int,
      json['icon'] as String,
    );

Map<String, dynamic> _$ResItemToJson(ResItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sub_type': instance.subType,
      'rarity': instance.rarity,
      'icon': instance.icon,
    };
