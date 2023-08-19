// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relic_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelicSet _$RelicSetFromJson(Map<String, dynamic> json) => RelicSet(
      json['id'] as String,
      json['name'] as String,
      (json['desc'] as List<dynamic>).map((e) => e as String).toList(),
      (json['properties'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => Property.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      json['icon'] as String,
      json['guide_overview'] as List<dynamic>,
    );

Map<String, dynamic> _$RelicSetToJson(RelicSet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'properties': instance.properties,
      'icon': instance.icon,
      'guide_overview': instance.guideOverview,
    };

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      json['type'] as String,
      (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };
