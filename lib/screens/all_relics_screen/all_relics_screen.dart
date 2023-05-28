import 'package:comet_rail/screens/home_screen/widgets/relic_card.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/providers/relic_data_providers/relic_desc_provider.dart';
import '../../services/providers/relic_data_providers/relics_data_provider.dart';

class AllRelicsScreen extends ConsumerWidget {
  const AllRelicsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(relicDescProvider).when(
            data: (relicDescData) {
              return ref.watch(relicsDataProvider).when(
                    data: (relicData) {
                      final nameList = relicDescData.values
                          .map((e) => e.pieces.values.first.name)
                          .toList();
                      return ListView.builder(
                        itemCount: nameList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: RelicCard(
                              index: 0,
                              relicData: relicData.values
                                  .where((element) =>
                                      element.name == nameList[index])
                                  .first),
                        ),
                      );
                    },
                    error: (error, stackTrace) =>
                        HttpCallErrorHandler(provider: relicDescProvider),
                    loading: () => const CircularProgressIndicator(),
                  );
            },
            error: (error, stackTrace) =>
                HttpCallErrorHandler(provider: relicDescProvider),
            loading: () => const CircularProgressIndicator(),
          ),
    );
  }
}
