import 'dart:convert';

import 'package:comet_rail/services/models/character_skills.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final characterSkillsDataProvider =
    FutureProvider<Map<String, CharacterSkill>>((ref) async {
  final response = await get(
    Uri.parse(
      "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/character_skills.json",
    ),
  );

  final Map<String, dynamic> dynamicData = jsonDecode(response.body);

  final parsedData = dynamicData
      .map((key, value) => MapEntry(key, CharacterSkill.fromJson(value)));
  return parsedData;
});
