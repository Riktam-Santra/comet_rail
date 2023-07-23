import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/services/models/selected_planar_data.dart';
import 'package:comet_rail/services/providers/character_data_providers/characters_data_provider.dart';
import 'package:comet_rail/services/providers/relic_data_providers/relics_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/providers/character_builder_selected_data_provider.dart';
import '../../widgets/rarity_indicator.dart';

class PlanarSelectorScreen extends ConsumerWidget {
  final int planarIndex;
  const PlanarSelectorScreen({super.key, required this.planarIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a Relic"),
      ),
      body: SafeArea(
        child: ref.read(relicsDataProvider).when(
              data: (normalData) {
                log(_parsePlanarIndex(planarIndex));
                final data = normalData.values
                    .where((element) =>
                        element.type == _parsePlanarIndex(planarIndex))
                    .where((element) => element.rarity == 5)
                    .where((element) => element.icon.isNotEmpty)
                    .toList();
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => Card(
                    child: InkWell(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          child: ClipOval(
                            child: CachedNetworkImage(
                                imageUrl:
                                    "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${data[index].icon}"),
                          ),
                        ),
                        title: Text(
                          (data.toList()[index].name == "{NICKNAME}"
                              ? 'Trailblazer'
                              : data.toList()[index].name),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Column(
                          children: [
                            RarityIndicator(
                                rarity: data.toList()[index].rarity),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Text(data.toList()[index].type),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        ref
                            .read(characterBuilderSelectedDataProvider.notifier)
                            .insertPlanarData(
                              SelectedPlanarData(relic: data.toList()[index]),
                              planarIndex,
                            );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
              error: (eror, stackTrace) => Center(
                child: HttpCallErrorHandler(
                  provider: charactersFutureProvider,
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }

  String _parsePlanarIndex(int index) {
    switch (index) {
      case 0:
        return "NECK";
      case 1:
        return "OBJECT";
      default:
        return "NECK";
    }
  }
}
