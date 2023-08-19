import 'dart:convert';

import 'package:comet_rail/services/models/json_models/paths.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final pathsDataProvider = FutureProvider<Map<String, Path>>((ref) async {
  final response = await get(Uri.parse(
      "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/paths.json"));

  final Map<String, dynamic> dynamicData = jsonDecode(response.body);

  final parsedData =
      dynamicData.map((key, value) => MapEntry(key, Path.fromJson(value)));

  return parsedData;
});
