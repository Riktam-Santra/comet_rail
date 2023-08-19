import 'dart:convert';

import 'package:comet_rail/services/models/json_models/item_desc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final itemDescProvider = FutureProvider<Map<String, ItemDesc>>((ref) async {
  final response = await get(Uri.parse(
      "https://raw.githubusercontent.com/Riktam-Santra/StarRailRes/master/index_new/en/item_desc.json"));
  return (jsonDecode(response.body) as Map<String, dynamic>).map(
    (key, value) => MapEntry(
      key,
      ItemDesc.fromJson(value),
    ),
  );
});
