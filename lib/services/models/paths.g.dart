// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paths.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Path _$PathFromJson(Map<String, dynamic> json) => Path(
      json['id'] as String,
      json['text'] as String,
      json['name'] as String,
      json['desc'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$PathToJson(Path instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'name': instance.name,
      'desc': instance.desc,
      'icon': instance.icon,
    };
