import 'dart:convert';
import 'package:comet_rail/services/models/json_models/res_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final itemDataProvider = FutureProvider<Map<String, ResItem>>((ref) async {
  final response = await get(Uri.parse(
      "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/items.json"));
  return (jsonDecode(response.body) as Map<String, dynamic>).map(
    (key, value) => MapEntry(
      key,
      ResItem.fromJson(value),
    ),
  );
});
