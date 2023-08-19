// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_cone_rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LightConeRank _$LightConeRankFromJson(Map<String, dynamic> json) =>
    LightConeRank(
      json['id'] as String,
      json['skill'] as String,
      json['desc'] as String,
      (json['params'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      (json['properties'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => Property.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$LightConeRankToJson(LightConeRank instance) =>
    <String, dynamic>{
      'id': instance.id,
      'skill': instance.skill,
      'desc': instance.desc,
      'params': instance.params,
      'properties': instance.properties,
    };

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      json['type'] as String,
      (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };
