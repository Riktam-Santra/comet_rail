import 'dart:convert';

import 'package:comet_rail/services/models/character_promotions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final characterPromotionsProvider =
    FutureProvider<Map<String, CharacterPromotion>>((ref) async {
  final response = await get(Uri.parse(
      "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/character_promotions.json"));

  final Map<String, dynamic> objectData = jsonDecode(response.body);

  final parsedData = objectData
      .map((key, value) => MapEntry(key, CharacterPromotion.fromJson(value)));

  return parsedData;
});
