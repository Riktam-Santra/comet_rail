import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/services/providers/character_data_providers/character_promotions_provider.dart';
import 'package:comet_rail/services/providers/character_data_providers/characters_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/providers/character_builder_selected_data_provider.dart';
import '../../widgets/element_icon.dart';
import '../../widgets/rarity_indicator.dart';

class CharacterSelectorScreen extends ConsumerWidget {
  const CharacterSelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a character"),
      ),
      body: SafeArea(
        child: ref.read(charactersFutureProvider).when(
              data: (normalData) {
                final data = normalData.characters.values
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
                          (data[index].name == "{NICKNAME}"
                              ? 'Trailblazer'
                              : data[index].name),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Column(
                          children: [
                            RarityIndicator(rarity: data[index].rarity),
                            Row(
                              children: [
                                ElementIcon(element: data[index].element),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Text(data[index].element),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        ref.watch(characterPromotionsProvider).when(
                            data: (promotionsData) {
                          ref
                              .read(
                                  characterBuilderSelectedDataProvider.notifier)
                              .setCharacter(
                                  data[index],
                                  promotionsData.values
                                      .where((element) =>
                                          element.id == data[index].id)
                                      .first);
                          Navigator.pop(context);
                        }, error: (error, stackTrace) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Unable to get stat related data, please try again"),
                            ),
                          );
                        }, loading: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "Stats related data is still loading, please wait..."),
                            ),
                          );
                        });
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
}
