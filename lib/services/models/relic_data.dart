import 'package:json_annotation/json_annotation.dart';
part 'relic_data.g.dart';

@JsonSerializable()
class RelicData {
  final String id;
  @JsonKey(name: "set_id")
  final String setId;
  final String name;
  final int rarity;
  final String type;
  @JsonKey(name: "max_level")
  final int maxLevel;
  @JsonKey(name: "main_affix_id")
  final String mainAffixId;
  @JsonKey(name: "sub_affix_id")
  final String subAffixId;
  final String icon;

  RelicData(this.id, this.setId, this.name, this.rarity, this.type,
      this.maxLevel, this.mainAffixId, this.subAffixId, this.icon);

  factory RelicData.fromJson(Map<String, dynamic> json) =>
      _$RelicDataFromJson(json);

  toJson() => _$RelicDataToJson(this);
}
