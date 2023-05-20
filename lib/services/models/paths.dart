import 'package:json_annotation/json_annotation.dart';
part 'paths.g.dart';

@JsonSerializable()
class Path {
  final String id;
  final String text;
  final String name;
  final String desc;
  final String icon;
  Path(this.id, this.text, this.name, this.desc, this.icon);

  factory Path.fromJson(Map<String, dynamic> json) => _$PathFromJson(json);

  toJson() => _$PathToJson(this);
}
