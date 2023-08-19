import 'package:comet_rail/services/models/json_models/characters.dart';
import 'package:comet_rail/services/models/json_models/light_cone.dart';
import 'package:comet_rail/services/models/json_models/promotions.dart';
import 'package:comet_rail/services/models/selected_planar_data.dart';
import 'package:comet_rail/services/models/selected_relic_data.dart';

class SelectedData {
  final Character? character;
  final Promotion? characterPromotionData;
  final Promotion? lightConePromotionData;
  final LightCone? lightCone;
  final SelectedRelicDataWrapper selectedRelic;
  final SelectedPlanerDataWrapper selectedPlanar;
  SelectedData({
    required this.character,
    required this.lightCone,
    required this.selectedRelic,
    required this.selectedPlanar,
    required this.characterPromotionData,
    required this.lightConePromotionData,
  });
}

class SelectedRelicDataWrapper {
  final SelectedRelicData? first;
  final SelectedRelicData? second;
  final SelectedRelicData? third;
  final SelectedRelicData? fourth;
  SelectedRelicDataWrapper({this.first, this.second, this.third, this.fourth});

  SelectedRelicDataWrapper copyWith(
          {SelectedRelicData? first,
          SelectedRelicData? second,
          SelectedRelicData? third,
          SelectedRelicData? fourth}) =>
      SelectedRelicDataWrapper(
          first: first ?? this.first,
          second: second ?? this.second,
          third: third ?? this.third,
          fourth: fourth ?? this.fourth);
}

class SelectedPlanerDataWrapper {
  final SelectedPlanarData? first;
  final SelectedPlanarData? second;
  SelectedPlanerDataWrapper({this.first, this.second});

  SelectedPlanerDataWrapper copyWith({
    SelectedPlanarData? first,
    SelectedPlanarData? second,
  }) =>
      SelectedPlanerDataWrapper(
        first: first ?? this.first,
        second: second ?? this.second,
      );
}
