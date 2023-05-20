// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_promotions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterPromotion _$CharacterPromotionFromJson(Map<String, dynamic> json) =>
    CharacterPromotion(
      json['id'] as String,
      (json['values'] as List<dynamic>)
          .map((e) => Value.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['materials'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => Material.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$CharacterPromotionToJson(CharacterPromotion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'values': instance.values,
      'materials': instance.materials,
    };

Value _$ValueFromJson(Map<String, dynamic> json) => Value(
      Stat.fromJson(json['hp'] as Map<String, dynamic>),
      Stat.fromJson(json['atk'] as Map<String, dynamic>),
      Stat.fromJson(json['def'] as Map<String, dynamic>),
      Stat.fromJson(json['spd'] as Map<String, dynamic>),
      Stat.fromJson(json['taunt'] as Map<String, dynamic>),
      Stat.fromJson(json['crit_rate'] as Map<String, dynamic>),
      Stat.fromJson(json['crit_dmg'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
      'hp': instance.hp,
      'atk': instance.atk,
      'def': instance.def,
      'spd': instance.spd,
      'taunt': instance.taunt,
      'crit_rate': instance.critRate,
      'crit_dmg': instance.critDmg,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      (json['base'] as num).toDouble(),
      (json['step'] as num).toDouble(),
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'base': instance.base,
      'step': instance.step,
    };

Material _$MaterialFromJson(Map<String, dynamic> json) => Material(
      json['id'] as String,
      json['num'] as int,
    );

Map<String, dynamic> _$MaterialToJson(Material instance) => <String, dynamic>{
      'id': instance.id,
      'num': instance.num,
    };
