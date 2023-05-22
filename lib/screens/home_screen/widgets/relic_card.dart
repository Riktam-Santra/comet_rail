import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/relic_detail_screen/relic_detail_screen.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/services/models/relic_data.dart';
import 'package:comet_rail/services/providers/relic_desc_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RelicCard extends StatelessWidget {
  final int index;
  final RelicData relicData;
  final bool? enabled;
  const RelicCard({
    super.key,
    required this.index,
    required this.relicData,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: CachedNetworkImage(
                          imageUrl:
                              "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${relicData.icon}"),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          relicData.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
                Consumer(
                  builder: (_, WidgetRef ref, __) {
                    return ref.watch(relicDescProvider).when(
                          data: (data) {
                            var text = "";
                            final relicPiecename = relicData.name;
                            for (final x in data.values) {
                              x.pieces.forEach((key, value) {
                                if (value.name == relicPiecename) {
                                  text = value.miniLore;
                                }
                              });
                            }

                            return Text(text);
                          },
                          error: (error, stackTrace) =>
                              HttpCallErrorHandler(provider: relicDescProvider),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                  },
                )
              ],
            ),
          ),
        ),
        onTap: () {
          if (enabled == null || enabled == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RelicDetailScreen(relicData: relicData),
              ),
            );
          } else {
            null;
          }
        });
  }
}
