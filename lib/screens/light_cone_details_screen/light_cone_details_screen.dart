import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/services/models/light_cone.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/providers/light_cone_desc_provider.dart';
import '../../utils.dart';
import '../widgets/rarity_indicator.dart';

class LigthConeDetailsScreen extends ConsumerWidget {
  final LightCone lightConeData;
  final int index;
  const LigthConeDetailsScreen({
    super.key,
    required this.lightConeData,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: 'lightConeCardTransition$index',
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${lightConeData.icon}",
                      ),
                    ),
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
                          Row(
                            children: rarityIndicator(lightConeData.rarity),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return ref.watch(lightConeDescProvider).when(
                        data: (data) => Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            data[lightConeData.name] ?? '',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        error: (error, stackTrace) => const Center(
                          child: Text("Something went wrong"),
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
