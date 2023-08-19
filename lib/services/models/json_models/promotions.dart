import 'package:comet_rail/services/models/abstract_models/stat_calculation.dart';
import 'package:comet_rail/services/models/calculated_value.dart';
import 'package:json_annotation/json_annotation.dart';
part 'promotions.g.dart';

@JsonSerializable()
class Promotion {
  final String id;
  final List<Value> values;
  final List<List<Material>> materials;

  Promotion(this.id, this.values, this.materials);

  factory Promotion.fromJson(Map<String, dynamic> json) =>
      _$PromotionFromJson(json);

  toJson() => _$PromotionToJson(this);

  CalculatedValue calculateValue(int levelLimit) {
    double hp = 0.0;
    double atk = 0.0;
    double def = 0.0;
    double spd = 0.0;
    double taunt = 0.0;
    double critDmg = 0.0;
    double critRate = 0.0;
    for (final value in values) {
      hp += value.hp.calculateStat(levelLimit);
      atk += value.atk.calculateStat(levelLimit);
      def += value.def.calculateStat(levelLimit);
      spd += value.spd?.calculateStat(levelLimit) ?? 0.0;
      taunt += value.taunt?.calculateStat(levelLimit) ?? 0.0;
      critDmg += value.critDmg?.calculateStat(levelLimit) ?? 0.0;
      critRate += value.critRate?.calculateStat(levelLimit) ?? 0.0;
    }
    return CalculatedValue(hp, atk, def, spd, taunt, critDmg, critRate);
  }
}

@JsonSerializable()
class Value {
  final Stat hp;
  final Stat atk;
  final Stat def;
  final Stat? spd;
  final Stat? taunt;
  @JsonKey(name: "crit_rate")
  final Stat? critRate;
  @JsonKey(name: "crit_dmg")
  final Stat? critDmg;

  Value(this.hp, this.atk, this.def, this.spd, this.taunt, this.critRate,
      this.critDmg);

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);

  toJson() => _$ValueToJson(this);
}

@JsonSerializable()
class Stat implements StatCalculation {
  final double base;
  final double step;
  Stat(this.base, this.step);

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  toJson() => _$StatToJson(this);

  @override
  double calculateStat(int levelLimit) {
    return base + (step * levelLimit);
  }
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
