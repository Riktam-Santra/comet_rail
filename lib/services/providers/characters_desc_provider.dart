import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final characterDescProvider = FutureProvider<Map<String, String>>((ref) async {
  final response = await get(Uri.parse(
      "https://raw.githubusercontent.com/Riktam-Santra/StarRailRes/master/index_new/en/character_desc_map.json"));

  final modifiedBody =
      response.body.replaceAll("<nobr>", "").replaceAll("</nobr>", "");

  final Map<String, dynamic> parsedData = jsonDecode(modifiedBody);

  final data = parsedData.map((key, value) => MapEntry(key, value.toString()));

  return data;
});
