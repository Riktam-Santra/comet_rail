import 'package:comet_rail/screens/home_screen/widgets/items_list/widgets/item_tile.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/services/providers/item_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemsList extends ConsumerWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(itemDataProvider).when(
          data: (data) {
            final randomList = ((data.values
                    .where((element) => element.name != ""))
                .toList()
                .where((element) => (int.parse(element.id)) > 110110)
                .toList())
              ..shuffle();

            final targetList = randomList.take(3).toList();

            final List<Widget> widgetList = [];
            for (int i = 0; i < targetList.length; i++) {
              widgetList.add(
                ItemTile(
                  itemData: targetList[i],
                ),
              );
              if (i != targetList.length - 1) {
                widgetList.add(const Divider());
              }
            }
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: widgetList,
                ),
              ),
            );
          },
          error: (error, stacktrace) =>
              HttpCallErrorHandler(provider: itemDataProvider),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
