// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RawItem _$RawItemFromJson(Map<String, dynamic> json) => RawItem(
      json['iconPath'] as String,
      json['name'] as String,
      json['rarity'] as int,
      json['purposeId'] as int,
      EmbeddedItem.fromJson(json['embeddedItem'] as Map<String, dynamic>),
      (json['itemReferences'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, EmbeddedItem.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$RawItemToJson(RawItem instance) => <String, dynamic>{
      'iconPath': instance.iconPath,
      'name': instance.name,
      'rarity': instance.rarity,
      'purposeId': instance.purposeId,
      'embeddedItem': instance.embeddedItem,
      'itemReferences': instance.itemReferences,
    };

EmbeddedItem _$EmbeddedItemFromJson(Map<String, dynamic> json) => EmbeddedItem(
      json['id'] as int,
      json['type'] as int,
      json['purposeId'] as int,
      json['iconPath'] as String,
      json['name'] as String,
      json['desc'] as String,
      json['lore'] as String,
      json['purpose'] as String,
      json['rarity'] as int,
      json['rewardPath'] as String,
      (json['comeFrom'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EmbeddedItemToJson(EmbeddedItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'purposeId': instance.purposeId,
      'iconPath': instance.iconPath,
      'name': instance.name,
      'desc': instance.desc,
      'lore': instance.lore,
      'purpose': instance.purpose,
      'rarity': instance.rarity,
      'rewardPath': instance.rewardPath,
      'comeFrom': instance.comeFrom,
    };
