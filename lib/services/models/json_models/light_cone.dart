import 'package:json_annotation/json_annotation.dart';
part 'light_cone.g.dart';

@JsonSerializable()
class LightCone {
  final String id;
  final String name;
  final int rarity;
  final String path;
  final String icon;
  @JsonKey(name: "guide_overview")
  final List<String> guideOverview;
  LightCone(this.id, this.name, this.rarity, this.path, this.icon,
      this.guideOverview);

  factory LightCone.fromJson(Map<String, dynamic> json) =>
      _$LightConeFromJson(json);

  toJson() => _$LightConeToJson(this);
}
