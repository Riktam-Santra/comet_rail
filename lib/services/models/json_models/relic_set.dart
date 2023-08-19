import 'package:json_annotation/json_annotation.dart';

part 'relic_set.g.dart';

@JsonSerializable()
class RelicSet {
  final String id;
  final String name;
  final List<String> desc;
  final List<List<Property>> properties;
  final String icon;
  @JsonKey(name: "guide_overview")
  final List<dynamic> guideOverview;
  RelicSet(this.id, this.name, this.desc, this.properties, this.icon,
      this.guideOverview);

  factory RelicSet.fromJson(Map<String, dynamic> json) =>
      _$RelicSetFromJson(json);

  Map<String, dynamic> toJson() => _$RelicSetToJson(this);
}

@JsonSerializable()
class Property {
  final String type;
  final double value;
  Property(this.type, this.value);

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}
