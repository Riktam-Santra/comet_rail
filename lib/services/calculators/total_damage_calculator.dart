import 'package:comet_rail/services/models/calculated_value.dart';
import 'package:comet_rail/services/models/selected_data.dart';

class TotalDamageCalculator {
  SelectedData selectedData;
  TotalDamageCalculator(this.selectedData);

  void calculateDamage(SelectedData selectedData) {
    CalculatedValue characterValue =
        selectedData.characterPromotionData?.calculateValue(10) ??
            CalculatedValue(0, 0, 0, 0, 0, 0, 0);

    CalculatedValue lightConeValue =
        selectedData.lightConePromotionData?.calculateValue(10) ??
            CalculatedValue(0, 0, 0, 0, 0, 0, 0);
  }
}
