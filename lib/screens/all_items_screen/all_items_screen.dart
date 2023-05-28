import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/providers/item_data_providers/item_data_provider.dart';
import '../home_screen/widgets/items_list/widgets/item_tile.dart';

class AllItemsScreen extends ConsumerWidget {
  const AllItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(itemDataProvider).when(
            data: (data) {
              final dataList =
                  (data.values.where((element) => element.name != ""))
                      .toList()
                      .where((element) => (int.parse(element.id)) > 110110)
                      .toList();

              return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return ItemTile(itemData: dataList[index]);
                  });
            },
            error: (error, stacktrace) =>
                HttpCallErrorHandler(provider: itemDataProvider),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
