import 'dart:convert';

import 'package:comet_rail/services/models/json_models/relic_set.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final relicSetDataProvider = FutureProvider<Map<String, RelicSet>>((ref) async {
  final response = await get(
    Uri.parse(
        "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/relic_sets.json"),
  );

  return (jsonDecode(response.body) as Map<String, dynamic>).map(
    (key, value) => MapEntry(
      key,
      RelicSet.fromJson(value),
    ),
  );
});
