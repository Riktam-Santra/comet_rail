import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchValueStateNotifier extends StateNotifier<String?> {
  SearchValueStateNotifier() : super(null);

  void setValue(String value) {
    if (value.isNotEmpty) {
      state = value;
    }
  }

  void clearValue() {
    state = null;
  }
}

final searchValueStateProvider =
    StateNotifierProvider<SearchValueStateNotifier, String?>((ref) {
  return SearchValueStateNotifier();
});
