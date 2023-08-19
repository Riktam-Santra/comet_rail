import 'dart:convert';

import 'package:comet_rail/services/models/json_models/relic_desc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final relicDescProvider = FutureProvider<Map<String, RelicDesc>>((ref) async {
  final response = await get(
    Uri.parse(
        "https://raw.githubusercontent.com/Riktam-Santra/StarRailRes/master/index_new/en/relic_set_map.json"),
  );

  return (jsonDecode(response.body) as Map<String, dynamic>).map(
    (key, value) => MapEntry(
      key,
      RelicDesc.fromJson(value),
    ),
  );
});
