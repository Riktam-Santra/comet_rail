import 'dart:convert';
import 'dart:developer';

import 'package:comet_rail/services/api/api.dart';
import 'package:comet_rail/services/models/character_skills.dart';
import 'package:comet_rail/services/models/characters.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

void main() {
  group("Model Data Parsing", () {
    test('Characters model parsing', () async {
      var response = await Api.getCharactersResponse();
      var parsedData = Characters.fromJson(jsonDecode(response.body));
      for (final x in parsedData.characters.entries) {
        log(x.value.name);
      }
      expect(parsedData.runtimeType, Characters);
    });
    test('Character skills Data Parsing', () async {
      final response = await get(
        Uri.parse(
          "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new/en/character_skills.json",
        ),
      );
      final Map<String, dynamic> dynamicData = jsonDecode(response.body);

      final parsedData = dynamicData
          .map((key, value) => MapEntry(key, CharacterSkill.fromJson(value)));
      for (final x in parsedData.entries) {
        log(x.value.id);
      }
    });
  });
}
