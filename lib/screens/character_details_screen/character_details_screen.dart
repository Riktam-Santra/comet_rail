import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/character_details_screen/widgets/path_card.dart';
import 'package:comet_rail/screens/character_details_screen/widgets/skills_card.dart';
import 'package:comet_rail/screens/character_details_screen/widgets/stat_card.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/models/characters.dart';
import '../../services/providers/characters_desc_provider.dart';
import '../../utils.dart';
import '../widgets/element_icon.dart';
import '../widgets/rarity_indicator.dart';

class CharacterDetailsScreen extends ConsumerWidget {
  final Character character;
  final int index;
  const CharacterDetailsScreen(
      {super.key, required this.character, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Hero(
          tag: 'homeScreenCharacterCard$index',
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/image/character_portrait/${character.id}.png",
                      placeholder: (context, url) {
                        return const SizedBox(
                          height: 312,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) =>
                          const Text("Error occured."),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              (character.name == "{NICKNAME}"
                                  ? 'Trailblazer'
                                  : character.name),
                              style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.left,
                            ),
                            const Spacer(),
                            Tooltip(
                              message:
                                  'The ${Utils.convertPathName(character.path)}',
                              child: ImageIcon(
                                CachedNetworkImageProvider(
                                    'https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/path/${Utils.convertPathName(character.path)}.png'),
                                size: 50,
                              ),
                            )
                          ],
                        ),
                        RarityIndicator(rarity: character.rarity),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              elementIcon(character.element),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  character.element,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Consumer(
                                builder: (context, ref, child) {
                                  return ref.watch(characterDescProvider).when(
                                        data: (data) => Text(
                                            data[character.name] ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                        error: (error, stackTrace) =>
                                            HttpCallErrorHandler(
                                                provider:
                                                    characterDescProvider),
                                        loading: () => Container(),
                                      );
                                },
                              ),
                            ),
                          ],
                        ),
                        StatCard(
                          id: character.id,
                        ),
                        PathCard(path: character.path),
                        SkillsCard(skillIds: character.skills)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
