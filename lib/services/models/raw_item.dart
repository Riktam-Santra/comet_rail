import 'package:json_annotation/json_annotation.dart';
part 'raw_item.g.dart';

@JsonSerializable()
class RawItem {
  final String iconPath;
  final String name;
  final int rarity;
  final int purposeId;
  final EmbeddedItem embeddedItem;
  final Map<String, EmbeddedItem> itemReferences;

  RawItem(this.iconPath, this.name, this.rarity, this.purposeId,
      this.embeddedItem, this.itemReferences);

  factory RawItem.fromJson(Map<String, dynamic> json) =>
      _$RawItemFromJson(json);

  toJson() => _$RawItemToJson(this);
}

@JsonSerializable()
class EmbeddedItem {
  final int id;
  final int type;
  final int purposeId;
  final String iconPath;
  final String name;
  final String desc;
  final String lore;
  final String purpose;
  final int rarity;
  final String rewardPath;
  final List<String> comeFrom;

  EmbeddedItem(
    this.id,
    this.type,
    this.purposeId,
    this.iconPath,
    this.name,
    this.desc,
    this.lore,
    this.purpose,
    this.rarity,
    this.rewardPath,
    this.comeFrom,
  );

  factory EmbeddedItem.fromJson(Map<String, dynamic> json) =>
      _$EmbeddedItemFromJson(json);

  toJson() => _$EmbeddedItemToJson(this);
}
