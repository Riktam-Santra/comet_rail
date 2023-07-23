import 'package:comet_rail/services/models/character_calculated_data_wrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CharacterCalculationNotifier
    extends StateNotifier<CharacterCalculatedDataWrapper?> {
  CharacterCalculationNotifier() : super(null);

  void changeState(CharacterCalculatedDataWrapper newState) {
    state = newState;
  }

  void reset() {
    state = null;
  }
}

final characterCalculationProvider = StateNotifierProvider<
    CharacterCalculationNotifier, CharacterCalculatedDataWrapper?>((ref) {
  return CharacterCalculationNotifier();
});
