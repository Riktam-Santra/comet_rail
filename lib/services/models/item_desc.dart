import 'package:json_annotation/json_annotation.dart';
part 'item_desc.g.dart';

@JsonSerializable()
class ItemDesc {
  final String desc;
  final String lore;

  ItemDesc(this.desc, this.lore);

  factory ItemDesc.fromJson(Map<String, dynamic> json) =>
      _$ItemDescFromJson(json);

  toJson() => _$ItemDescToJson(this);
}
