import 'dart:convert';

import 'package:comet_rail/services/models/json_models/relic_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final relicsDataProvider = FutureProvider<Map<String, RelicData>>((ref) async {
  final response = await get(
    Uri.parse(
        "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/relics.json"),
  );

  return (jsonDecode(response.body) as Map<String, dynamic>).map(
    (key, value) => MapEntry(
      key,
      RelicData.fromJson(value),
    ),
  );
});
