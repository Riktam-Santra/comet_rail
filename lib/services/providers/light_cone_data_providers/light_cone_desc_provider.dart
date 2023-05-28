import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final lightConeDescProvider = FutureProvider<Map<String, String>>((ref) async {
  final response = await get(Uri.parse(
      "https://raw.githubusercontent.com/Riktam-Santra/StarRailRes/master/index_new/en/light_cone_desc_map.json"));

  final Map<String, dynamic> parsedData = jsonDecode(response.body);

  final data = parsedData.map((key, value) => MapEntry(key, value.toString()));

  return data;
});
