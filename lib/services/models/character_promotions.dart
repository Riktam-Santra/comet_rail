import 'package:json_annotation/json_annotation.dart';
part 'character_promotions.g.dart';

@JsonSerializable()
class CharacterPromotion {
  final String id;
  final List<Value> values;
  final List<List<Material>> materials;

  CharacterPromotion(this.id, this.values, this.materials);

  factory CharacterPromotion.fromJson(Map<String, dynamic> json) =>
      _$CharacterPromotionFromJson(json);

  toJson() => _$CharacterPromotionToJson(this);
}

@JsonSerializable()
class Value {
  final Stat hp;
  final Stat atk;
  final Stat def;
  final Stat spd;
  final Stat taunt;
  @JsonKey(name: "crit_rate")
  final Stat critRate;
  @JsonKey(name: "crit_dmg")
  final Stat critDmg;

  Value(this.hp, this.atk, this.def, this.spd, this.taunt, this.critRate,
      this.critDmg);

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);

  toJson() => _$ValueToJson(this);
}

@JsonSerializable()
class Stat {
  final double base;
  final double step;
  Stat(this.base, this.step);

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  toJson() => _$StatToJson(this);
}

@JsonSerializable()
class Material {
  final String id;
  final int num;

  Material(this.id, this.num);

  factory Material.fromJson(Map<String, dynamic> json) =>
      _$MaterialFromJson(json);

  toJson() => _$MaterialToJson(this);
}
