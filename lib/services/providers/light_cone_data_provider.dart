import 'dart:convert';

import 'package:comet_rail/services/models/light_cone.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final lightConeDataProvider =
    FutureProvider<Map<String, LightCone>>((ref) async {
  final response = await get(
    Uri.parse(
        "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/light_cones.json"),
  );

  final Map<String, dynamic> objectParsed = jsonDecode(response.body);

  return objectParsed.map(
    (key, value) => MapEntry(
      key,
      LightCone.fromJson(value),
    ),
  );
});
