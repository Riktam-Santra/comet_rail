import 'package:comet_rail/services/models/character_builder_selected_data.dart';
import 'package:comet_rail/services/models/light_cone.dart';
import 'package:comet_rail/services/models/selected_planar_data.dart';
import 'package:comet_rail/services/models/selected_relic_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/characters.dart';

class CharacterBuilderSelectedDataNotifier extends StateNotifier<SelectedData> {
  CharacterBuilderSelectedDataNotifier()
      : super(
          SelectedData(
            character: null,
            lightCone: null,
            selectedRelic: SelectedRelicDataWrapper(),
            selectedPlanar: SelectedPlanerDataWrapper(),
          ),
        );

  void setCharacter(Character character) {
    state = SelectedData(
        character: character,
        lightCone: state.lightCone,
        selectedRelic: state.selectedRelic,
        selectedPlanar: state.selectedPlanar);
  }

  void clearCharacter() {
    state = SelectedData(
        character: null,
        lightCone: state.lightCone,
        selectedRelic: state.selectedRelic,
        selectedPlanar: state.selectedPlanar);
  }

  void setLightCone(LightCone lightCone) {
    state = SelectedData(
        character: state.character,
        lightCone: lightCone,
        selectedRelic: state.selectedRelic,
        selectedPlanar: state.selectedPlanar);
  }

  void clearLightCone() {
    state = SelectedData(
        character: state.character,
        lightCone: null,
        selectedRelic: state.selectedRelic,
        selectedPlanar: state.selectedPlanar);
  }

  void insertRelicData(SelectedRelicData selectedRelicData, int index) {
    SelectedRelicDataWrapper data;

    switch (index) {
      case 0:
        data = state.selectedRelic.copyWith(first: selectedRelicData);
      case 1:
        data = state.selectedRelic.copyWith(second: selectedRelicData);
      case 2:
        data = state.selectedRelic.copyWith(third: selectedRelicData);
      case 3:
        data = state.selectedRelic.copyWith(fourth: selectedRelicData);
      default:
        data = state.selectedRelic;
    }

    state = SelectedData(
        character: state.character,
        lightCone: state.lightCone,
        selectedRelic: data,
        selectedPlanar: state.selectedPlanar);
  }

  void clearRelics() {
    state = SelectedData(
        character: state.character,
        lightCone: state.lightCone,
        selectedRelic: SelectedRelicDataWrapper(),
        selectedPlanar: state.selectedPlanar);
  }

  void insertPlanarData(SelectedPlanarData selectedPlanarData, int index) {
    SelectedPlanerDataWrapper data;

    switch (index) {
      case 0:
        data = state.selectedPlanar.copyWith(first: selectedPlanarData);
      case 1:
        data = state.selectedPlanar.copyWith(second: selectedPlanarData);
      default:
        data = state.selectedPlanar;
    }

    state = SelectedData(
        character: state.character,
        lightCone: state.lightCone,
        selectedRelic: state.selectedRelic,
        selectedPlanar: data);
  }

  void clearPlanars() {
    state = SelectedData(
      character: state.character,
      lightCone: state.lightCone,
      selectedRelic: state.selectedRelic,
      selectedPlanar: SelectedPlanerDataWrapper(),
    );
  }
}

final characterBuilderSelectedDataProvider =
    StateNotifierProvider<CharacterBuilderSelectedDataNotifier, SelectedData>(
        (ref) => CharacterBuilderSelectedDataNotifier());
