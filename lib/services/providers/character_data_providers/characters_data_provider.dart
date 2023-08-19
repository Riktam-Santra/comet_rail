import 'package:comet_rail/services/api/api.dart';
import 'package:comet_rail/services/models/json_models/characters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final charactersFutureProvider = FutureProvider<Characters>((ref) async {
  return await Api.getCharacters();
});
