import 'package:comet_rail/screens/home_screen/widgets/light_cone_card.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/providers/ight_cone_data_providers/light_cone_data_provider.dart';

class AllLightConesScreen extends ConsumerWidget {
  const AllLightConesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Light Cones"),
      ),
      body: ref.watch(lightConeDataProvider).when(
            data: (data) {
              final lightConesList =
                  data.values.where((element) => element.name != "").toList();

              final newList = [
                ...(lightConesList
                    .where((element) => element.rarity == 5)
                    .toList()),
                ...(lightConesList
                    .where((element) => element.rarity == 4)
                    .toList()),
                ...(lightConesList
                    .where((element) => element.rarity == 3)
                    .toList())
              ];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: newList.length,
                  itemBuilder: (context, index) => LightConeCard(
                    lightConeData: newList[index],
                    index: index,
                  ),
                ),
              );
            },
            error: (error, stackTrace) =>
                HttpCallErrorHandler(provider: lightConeDataProvider),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
