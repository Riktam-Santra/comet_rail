import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationIndexNotifier extends StateNotifier<int> {
  NavigationIndexNotifier() : super(0);

  void setVal(int x) => state = x;

  void resetVal() => state = 0;
}

final navigationIndexProvider =
    StateNotifierProvider<NavigationIndexNotifier, int>((ref) {
  return NavigationIndexNotifier();
});
