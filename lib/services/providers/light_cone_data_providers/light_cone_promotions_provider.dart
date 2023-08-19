import 'dart:convert';

import 'package:comet_rail/services/models/json_models/promotions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final lightConePromotionProvider =
    FutureProvider<Map<String, Promotion>>((ref) async {
  final response = await get(Uri.parse(
      "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/light_cone_promotions.json"));

  final Map<String, dynamic> objectData = jsonDecode(response.body);

  return objectData.map(
    (key, value) => MapEntry(
      key,
      Promotion.fromJson(value),
    ),
  );
});
