import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/screens/widgets/element_icon.dart';
import 'package:comet_rail/screens/widgets/rarity_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/providers/character_data_providers/characters_data_provider.dart';

class CharacterBuilderScreen extends ConsumerWidget {
  const CharacterBuilderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Character Builder",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Consumer(
                builder: (_, WidgetRef ref, __) {
                  return ref.watch(charactersFutureProvider).when(
                        data: (data) {
                          final random = Random();

                          final character = (data.characters.values.toList())[
                              random.nextInt(
                                  data.characters.values.toList().length - 1)];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${character.icon}"),
                                ),
                              ),
                              title: Text(
                                (character.name == "{NICKNAME}"
                                    ? 'Trailblazer'
                                    : character.name),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              subtitle: Column(
                                children: [
                                  RarityIndicator(rarity: character.rarity),
                                  Row(
                                    children: [
                                      ElementIcon(element: character.element),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Text(character.element),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        error: (error, stackTrace) => Container(),
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
