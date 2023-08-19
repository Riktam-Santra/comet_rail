import 'package:json_annotation/json_annotation.dart';
part 'res_item.g.dart';

@JsonSerializable()
class ResItem {
  final String id;
  final String name;

  @JsonKey(name: "sub_type")
  final String subType;

  final int rarity;
  final String icon;

  ResItem(this.id, this.name, this.subType, this.rarity, this.icon);

  factory ResItem.fromJson(Map<String, dynamic> json) =>
      _$ResItemFromJson(json);

  toJson() => _$ResItemToJson(this);
}
