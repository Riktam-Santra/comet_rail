import 'package:comet_rail/services/models/json_models/relic_data.dart';
import 'package:comet_rail/services/models/selected_stat_data.dart';

class SelectedRelicData {
  final RelicData relic;
  final SelectedStatData? statData;

  SelectedRelicData({required this.relic, this.statData});
}
