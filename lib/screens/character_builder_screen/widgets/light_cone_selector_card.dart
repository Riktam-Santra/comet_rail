import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/providers/character_builder_selected_data_provider.dart';
import '../../../services/providers/light_cone_data_providers/light_cone_data_provider.dart';
import '../../../utils.dart';
import '../../widgets/rarity_indicator.dart';
import '../screens/light_cone_selector_screen.dart';

class LightConeSelectorCard extends StatelessWidget {
  const LightConeSelectorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        return ref.watch(lightConeDataProvider).when(
              data: (data) {
                return Card(
                  child: Consumer(
                    builder: (_, WidgetRef ref, __) {
                      final selectedData =
                          ref.watch(characterBuilderSelectedDataProvider);

                      return selectedData.lightCone != null
                          ? InkWell(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  child: ClipOval(
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${selectedData.lightCone!.icon}"),
                                  ),
                                ),
                                title: Text(
                                  (selectedData.lightCone!.name),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                subtitle: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: RarityIndicator(
                                          rarity:
                                              selectedData.lightCone!.rarity),
                                    ),
                                    Row(
                                      children: [
                                        ImageIcon(
                                          CachedNetworkImageProvider(
                                              "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/path/${Utils.convertPathName(selectedData.lightCone!.path)}.png"),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            selectedData.lightCone!.path,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LightConeSelectorScreen(),
                                ),
                              ),
                            )
                          : InkWell(
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Icon(
                                      Icons.add,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          "Select a Light Cone",
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LightConeSelectorScreen(),
                                ),
                              ),
                            );
                    },
                  ),
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
      },
    );
  }
}
