import 'package:comet_rail/services/providers/navigation_index_provider.dart';
import 'package:comet_rail/services/providers/search_helper_providers/search_value_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  final PageController controller;
  const CustomBottomNavigationBar({
    super.key,
    required this.controller,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends ConsumerState<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        return BottomNavigationBar(
          currentIndex: ref.watch(navigationIndexProvider),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.construction), label: "Builder"),
          ],
          onTap: (int x) {
            widget.controller.animateToPage(
              x,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn,
            );
            ref.read(navigationIndexProvider.notifier).setVal(x);
            if (x == 0) {
              ref.read(searchValueStateProvider.notifier).clearValue();
            }
          },
        );
      },
    );
  }
}
