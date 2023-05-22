import 'package:json_annotation/json_annotation.dart';
part 'relic_desc.g.dart';

@JsonSerializable()
class RelicDesc {
  final String name;
  final List<Skill> skills;
  final Map<String, Piece> pieces;

  RelicDesc(this.name, this.skills, this.pieces);

  factory RelicDesc.fromJson(Map<String, dynamic> json) =>
      _$RelicDescFromJson(json);

  toJson() => _$RelicDescToJson(this);
}

@JsonSerializable()
class Skill {
  final int useNum;
  final String desc;
  final List<double> params;

  Skill(this.useNum, this.desc, this.params);

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  toJson() => _$SkillToJson(this);
}

@JsonSerializable()
class Piece {
  final String name;
  final int maxRarity;
  final String loreTitle;
  final String miniLore;
  final String lore;

  Piece(this.name, this.maxRarity, this.loreTitle, this.miniLore, this.lore);

  factory Piece.fromJson(Map<String, dynamic> json) => _$PieceFromJson(json);

  toJson() => _$PieceToJson(this);
}
