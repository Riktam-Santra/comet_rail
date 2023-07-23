import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/light_cone_details_screen/light_cone_details_screen.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/screens/widgets/rarity_indicator.dart';
import 'package:comet_rail/services/models/light_cone.dart';
import 'package:comet_rail/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/providers/light_cone_data_providers/light_cone_desc_provider.dart';

class LightConeCard extends StatelessWidget {
  final LightCone lightConeData;
  final int index;
  const LightConeCard(
      {super.key, required this.lightConeData, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LigthConeDetailsScreen(
              lightConeData: lightConeData,
              index: index,
            ),
          ),
        ),
        child: Hero(
          tag: 'lightConeCardTransition$index',
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: 80,
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${lightConeData.icon}",
                          )),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              lightConeData.name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              children: [
                                ImageIcon(
                                  CachedNetworkImageProvider(
                                      'https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/path/${Utils.convertPathName(lightConeData.path)}.png'),
                                ),
                                Text(
                                  "The ${Utils.convertPathName(lightConeData.path)}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            RarityIndicator(rarity: lightConeData.rarity),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Consumer(
                      builder: (context, ref, child) {
                        return ref.watch(lightConeDescProvider).when(
                              data: (data) => Text(
                                data[lightConeData.name] ?? '',
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              error: (error, stackTrace) =>
                                  HttpCallErrorHandler(
                                      provider: lightConeDescProvider),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
