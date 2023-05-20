import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/services/providers/character_promotions_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StatCard extends ConsumerWidget {
  final String id;
  const StatCard({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(characterPromotionsProvider).when(
          data: (data) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Base Stats",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Spacer(),
                        const Chip(label: Text("Level 1 "))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Tooltip(
                              message: "HP",
                              child: ImageIcon(
                                CachedNetworkImageProvider(
                                    "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/property/IconMaxHP.png"),
                                size: 40,
                              ),
                            ),
                            Text("${data[id]!.values[0].hp.base.round()}")
                          ],
                        ),
                        Column(
                          children: [
                            const Tooltip(
                              message: "ATK",
                              child: ImageIcon(
                                CachedNetworkImageProvider(
                                    "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/property/IconAttack.png"),
                                size: 40,
                              ),
                            ),
                            Text("${data[id]!.values[0].atk.base.round()}")
                          ],
                        ),
                        Column(
                          children: [
                            const Tooltip(
                              message: "DEF",
                              child: ImageIcon(
                                CachedNetworkImageProvider(
                                    "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/property/IconDefence.png"),
                                size: 40,
                              ),
                            ),
                            Text("${data[id]!.values[0].def.base.round()}")
                          ],
                        ),
                        Column(
                          children: [
                            const Tooltip(
                              message: "SPD",
                              child: ImageIcon(
                                CachedNetworkImageProvider(
                                    "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/property/IconSpeed.png"),
                                size: 40,
                              ),
                            ),
                            Text("${data[id]!.values[0].spd.base.round()}")
                          ],
                        ),
                        Column(
                          children: [
                            const Tooltip(
                              message: "Taunt",
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: ImageIcon(
                                  AssetImage("assets/taunt.png"),
                                  size: 30,
                                ),
                              ),
                            ),
                            Text("${data[id]!.values[0].taunt.base.round()}")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => const Center(
            child: Text("Unable to load stats"),
          ),
          loading: () => const Padding(
            padding: EdgeInsets.all(10),
            child: CircularProgressIndicator(),
          ),
        );
  }
}
