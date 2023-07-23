import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/services/providers/light_cone_data_providers/light_cone_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/providers/character_builder_selected_data_provider.dart';
import '../../../utils.dart';
import '../../widgets/rarity_indicator.dart';

class LightConeSelectorScreen extends ConsumerWidget {
  const LightConeSelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a light cone"),
      ),
      body: SafeArea(
        child: ref.read(lightConeDataProvider).when(
              data: (data) => ListView.builder(
                itemCount: data.values.length,
                itemBuilder: (context, index) => Card(
                  child: InkWell(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        child: ClipOval(
                          child: CachedNetworkImage(
                              imageUrl:
                                  "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${data.values.toList()[index].icon}"),
                        ),
                      ),
                      title: Text(
                        (data.values.toList()[index].name == "{NICKNAME}"
                            ? 'Trailblazer'
                            : data.values.toList()[index].name),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Column(
                        children: [
                          RarityIndicator(
                              rarity: data.values.toList()[index].rarity),
                          Row(
                            children: [
                              ImageIcon(CachedNetworkImageProvider(
                                  "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/path/${Utils.convertPathName(data.values.toList()[index].path)}.png")),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Text(data.values.toList()[index].path),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      ref
                          .read(characterBuilderSelectedDataProvider.notifier)
                          .setLightCone(data.values.toList()[index]);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              error: (eror, stackTrace) => Center(
                child: HttpCallErrorHandler(
                  provider: lightConeDataProvider,
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }
}
