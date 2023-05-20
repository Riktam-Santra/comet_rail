import 'dart:convert';
import 'package:comet_rail/services/enums/lang.dart';
import 'package:http/http.dart' as http;

import '../models/characters.dart';

abstract class Api {
  static const String _authority =
      'https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/index_new';

  static Future<http.Response> getCharactersResponse({Lang? language}) async {
    return await http.get(Uri.parse(
        "$_authority/${language == null ? Lang.en : language.toString()}/characters.json"));
  }

  static Future<Characters> getCharacters({Lang? language}) async {
    var response = await getCharactersResponse();
    return Characters.fromJson(jsonDecode(response.body));
  }
}
