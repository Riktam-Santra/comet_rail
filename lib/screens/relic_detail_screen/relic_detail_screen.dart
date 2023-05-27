import 'package:comet_rail/screens/home_screen/widgets/relic_card.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/services/models/relic_data.dart';
import 'package:comet_rail/services/models/relic_desc.dart';
import 'package:comet_rail/services/providers/relic_desc_provider.dart';
import 'package:comet_rail/services/providers/relics_data_provider.dart';
import 'package:comet_rail/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RelicDetailScreen extends ConsumerWidget {
  final RelicData relicData;
  const RelicDetailScreen({super.key, required this.relicData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ref.watch(relicDescProvider).when(
              data: (data) {
                RelicDesc? relicSet;

                for (final desc in data.values) {
                  for (final element in desc.pieces.values) {
                    if (element.name == relicData.name) {
                      relicSet = desc;
                    }
                  }
                }

                return relicSet == null
                    ? const Center(
                        child: Text("Soemthing went wrong"),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                relicSet.name,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              const Divider(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Set Piece Bonus",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: relicSet.skills
                                              .map(
                                                (e) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${e.useNum} Piece Set: ",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall,
                                                      ),
                                                      Expanded(
                                                        child: Text(Utils
                                                            .parseRelicStatInDesc(
                                                                e.desc
                                                                    .replaceAll(
                                                                        "<nobr>",
                                                                        "")
                                                                    .replaceAll(
                                                                        "</nobr>",
                                                                        ""),
                                                                e.params)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Pieces",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              ref.watch(relicsDataProvider).when(
                                    data: (data) {
                                      final widgetList = relicSet!.pieces.values
                                          .map(
                                            (e) => RelicCard(
                                              index: 0,
                                              relicData: data.values
                                                  .where((element) =>
                                                      element.name == e.name)
                                                  .first,
                                              enabled: false,
                                            ),
                                          )
                                          .toList();
                                      return Column(
                                        children: widgetList,
                                      );
                                    },
                                    error: (error, stackTrace) =>
                                        HttpCallErrorHandler(
                                            provider: relicsDataProvider),
                                    loading: () => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      );
              },
              error: (error, stackTrace) =>
                  HttpCallErrorHandler(provider: relicDescProvider),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }
}
