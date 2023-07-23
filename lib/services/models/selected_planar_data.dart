import 'package:comet_rail/services/models/relic_data.dart';
import 'package:comet_rail/services/models/selected_stat_data.dart';

class SelectedPlanarData {
  final RelicData relic;
  final SelectedStatData? statData;

  SelectedPlanarData({required this.relic, this.statData});
}
