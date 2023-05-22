import 'dart:convert';

import 'package:comet_rail/services/models/light_cone_rank.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final lightConeRankDataProvider =
    FutureProvider<Map<String, LightConeRank>>((ref) async {
  final response = await get(Uri.parse(
      "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/light_cone_ranks.json"));

  final Map<String, dynamic> objectData = jsonDecode(response.body);

  return objectData.map(
    (key, value) => MapEntry(
      key,
      LightConeRank.fromJson(value),
    ),
  );
});
