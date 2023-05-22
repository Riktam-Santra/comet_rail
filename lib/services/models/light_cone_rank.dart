import 'package:json_annotation/json_annotation.dart';
part 'light_cone_rank.g.dart';

@JsonSerializable()
class LightConeRank {
  final String id;
  final String skill;
  final String desc;
  final List<List<double>> params;
  final List<List<Property>> properties;

  LightConeRank(this.id, this.skill, this.desc, this.params, this.properties);

  factory LightConeRank.fromJson(Map<String, dynamic> json) =>
      _$LightConeRankFromJson(json);

  toJson() => _$LightConeRankToJson(this);
}

@JsonSerializable()
class Property {
  final String type;
  final double value;
  Property(this.type, this.value);

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  toJson() => _$PropertyToJson(this);
}
