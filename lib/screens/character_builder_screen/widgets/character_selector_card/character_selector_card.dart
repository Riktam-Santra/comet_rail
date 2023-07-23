import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:comet_rail/services/providers/character_data_providers/character_skills_data_provider.dart';
import 'package:comet_rail/services/providers/dark_mode_provider.dart';
import 'package:comet_rail/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../services/providers/character_builder_selected_data_provider.dart';
import '../../../../services/providers/character_data_providers/characters_data_provider.dart';
import '../../../widgets/element_icon.dart';
import '../../../widgets/rarity_indicator.dart';
import '../../screens/character_selector_screen.dart';

class CharacterSelectorCard extends StatelessWidget {
  const CharacterSelectorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        return ref.watch(charactersFutureProvider).when(
              data: (data) {
                return ref.watch(characterSkillsDataProvider).when(
                      data: (characterSkillData) {
                        final darkMode = ref.watch(darkModeProvider);
                        final selectedData =
                            ref.watch(characterBuilderSelectedDataProvider);
                        return CarouselSlider(
                          items: [
                            selectedData.character != null
                                ? Card(
                                    child: InkWell(
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              radius: 25,
                                              child: ClipOval(
                                                child: CachedNetworkImage(
                                                    imageUrl:
                                                        "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${selectedData.character!.icon}"),
                                              ),
                                            ),
                                            title: Text(
                                              (selectedData.character!.name ==
                                                      "{NICKNAME}"
                                                  ? 'Trailblazer'
                                                  : selectedData
                                                      .character!.name),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                            subtitle: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 5.0),
                                                  child: RarityIndicator(
                                                      rarity: selectedData
                                                          .character!.rarity),
                                                ),
                                                Row(
                                                  children: [
                                                    ElementIcon(
                                                        element: selectedData
                                                            .character!
                                                            .element),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5.0),
                                                      child: Text(selectedData
                                                          .character!.element),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            trailing: CircleAvatar(
                                              maxRadius: 25,
                                              backgroundColor: darkMode
                                                  ? Colors.grey[900]
                                                  : Colors.grey,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/path/${Utils.convertPathName(selectedData.character!.path)}.png",
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10,
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "Enter Level"),
                                            ),
                                          )
                                        ],
                                      ),
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CharacterSelectorScreen(),
                                        ),
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
                                            child: Text(
                                              "Select a character",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CharacterSelectorScreen(),
                                      ),
                                    ),
                                  ),
                            selectedData.character != null
                                ? Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              child: CachedNetworkImage(
                                                  imageUrl:
                                                      "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/path/${characterSkillData.entries.where((element) => element.key == selectedData.character!.id).first.value.icon}"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                          options: CarouselOptions(
                              viewportFraction: 1, aspectRatio: 1.75),
                        );
                      },
                      error: (error, stackTrace) => HttpCallErrorHandler(
                          provider: characterSkillsDataProvider),
                      loading: () => CircularProgressIndicator(),
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
