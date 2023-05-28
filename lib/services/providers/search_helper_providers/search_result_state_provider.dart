import 'dart:developer';

import 'package:comet_rail/screens/home_screen/widgets/character_card.dart';
import 'package:comet_rail/screens/home_screen/widgets/items_list/widgets/item_tile.dart';
import 'package:comet_rail/screens/home_screen/widgets/light_cone_card.dart';
import 'package:comet_rail/screens/home_screen/widgets/relic_card.dart';
import 'package:comet_rail/services/models/characters.dart';
import 'package:comet_rail/services/providers/search_helper_providers/search_value_state_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/light_cone.dart';
import '../../models/relic_data.dart';
import '../../models/res_item.dart';
import '../character_data_providers/characters_data_provider.dart';
import '../light_cone_data_providers/light_cone_data_provider.dart';
import '../item_data_providers/item_data_provider.dart';
import '../relic_data_providers/relics_data_provider.dart';

final searchResultProvider = FutureProvider<AppSearchResults?>((ref) async {
  final value = ref.watch(searchValueStateProvider);

  if (value != null) {
    final result = await searchInData(ref, value);

    return result;
  }
  return null;
});

Future<AppSearchResults> searchInData(
    FutureProviderRef<AppSearchResults?> ref, String searchValue) {
  log("Got search value $searchValue");
  final characterData = ref.watch(charactersFutureProvider).value!;
  final lightConeData = ref.watch(lightConeDataProvider).value!;
  final itemData = ref.watch(itemDataProvider).value!;
  final relicData = ref.watch(relicsDataProvider).value!;

  final computeValue = AppDataWrapper(
      searchValue, characterData, lightConeData, itemData, relicData);

  return compute((message) {
    log("Compute triggered!");
    final characterSearchResult = computeValue.characterData.characters.values
        .where(
          (element) =>
              element.name.toLowerCase().toLowerCase().contains(searchValue),
        )
        .map(
          (e) => CharacterCard(character: e, index: 0),
        )
        .toList();

    final itemSearchResult = computeValue.itemData.values
        .where(
          (element) => element.name.toLowerCase().contains(searchValue),
        )
        .map(
          (e) => ItemTile(
            itemData: e,
          ),
        )
        .toList();

    final lightConeSearchResult = computeValue.lightConeData.values
        .where(
          (element) => element.name.toLowerCase().contains(searchValue),
        )
        .map(
          (e) => LightConeCard(lightConeData: e, index: 0),
        )
        .toList();

    final relicSearchResult = computeValue.relicData.values
        .where(
          (element) => element.name.toLowerCase().contains(searchValue),
        )
        .map(
          (e) => RelicCard(relicData: e, index: 0),
        )
        .toList();

    final result = AppSearchResults(characterSearchResult,
        lightConeSearchResult, itemSearchResult, relicSearchResult);

    return result;
  }, computeValue);
}

class AppSearchResults {
  final List<CharacterCard>? characterSearchResults;
  final List<LightConeCard>? lightConeSearchResults;
  final List<ItemTile>? itemSearchResults;
  final List<RelicCard>? relicSearchResults;

  AppSearchResults(this.characterSearchResults, this.lightConeSearchResults,
      this.itemSearchResults, this.relicSearchResults);
}

class AppDataWrapper {
  final String searchValue;
  final Characters characterData;
  final Map<String, LightCone> lightConeData;
  final Map<String, ResItem> itemData;
  final Map<String, RelicData> relicData;
  AppDataWrapper(this.searchValue, this.characterData, this.lightConeData,
      this.itemData, this.relicData);
}
