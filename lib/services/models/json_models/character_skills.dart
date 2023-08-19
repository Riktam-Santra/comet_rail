import 'package:json_annotation/json_annotation.dart';

part 'character_skills.g.dart';

@JsonSerializable()
class CharacterSkill {
  final String id;
  final String name;
  @JsonKey(name: "max_level")
  final int maxLevel;
  final String element;
  final String type;
  @JsonKey(name: "text_type")
  final String? textType;
  final String effect;
  @JsonKey(name: "effect_type")
  final String? effectType;
  @JsonKey(name: "simple_desc")
  final String simpleDesc;
  final String desc;
  final List<List<double>> params;
  final String icon;
  CharacterSkill(
      this.id,
      this.name,
      this.maxLevel,
      this.element,
      this.type,
      this.textType,
      this.effect,
      this.effectType,
      this.simpleDesc,
      this.desc,
      this.params,
      this.icon);

  factory CharacterSkill.fromJson(Map<String, dynamic> json) =>
      _$CharacterSkillFromJson(json);

  toJson() => _$CharacterSkillToJson(this);
}
