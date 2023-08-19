import 'package:json_annotation/json_annotation.dart';
part 'characters.g.dart';

@JsonSerializable()
class Character {
  final String id;
  final String name;
  final String tag;
  final int rarity;
  final String path;
  final String element;
  @JsonKey(name: "max_sp")
  final double maxSp;
  final List<String> ranks;
  final List<String> skills;
  @JsonKey(name: "skill_trees")
  final List<String>? skillTrees;
  final String icon;
  final String preview;
  final String portrait;
  @JsonKey(name: "guide_overview")
  final List<String> guideOverview;
  @JsonKey(name: "guide_material")
  final List<String> guideMaterial;
  Character(
      this.id,
      this.name,
      this.tag,
      this.rarity,
      this.path,
      this.element,
      this.maxSp,
      this.ranks,
      this.skills,
      this.skillTrees,
      this.icon,
      this.preview,
      this.portrait,
      this.guideOverview,
      this.guideMaterial);

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  toJson() => _$CharacterToJson(this);
}

class Characters {
  final Map<String, Character> characters;
  Characters(this.characters);
  factory Characters.fromJson(Map<String, dynamic> json) {
    var data = json.map(
      (key, value) => MapEntry(
        key,
        Character.fromJson(value),
      ),
    );
    return Characters(data);
  }
}
