import 'package:comet_rail/constants/stats.dart';

class SelectedStatData {
  final Stat? first;
  final Stat? second;
  final Stat? third;
  final Stat? fourth;
  final Stat? fifth;
  SelectedStatData({
    this.first,
    this.second,
    this.third,
    this.fourth,
    this.fifth,
  });

  copyWith({
    Stat? first,
    Stat? second,
    Stat? third,
    Stat? fourth,
    Stat? fifth,
  }) {
    return SelectedStatData(
      first: first ?? this.first,
      second: second ?? this.second,
      third: third ?? this.third,
      fourth: fourth ?? this.fourth,
      fifth: fifth ?? this.fifth,
    );
  }
}
