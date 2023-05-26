import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:comet_rail/services/providers/characters_future_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: CircleAvatar(
                                radius: 25,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          "https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/${character.icon}"),
                                ),
                              ),
                            ),
                          );
                        },
                        error: (error, stackTrace) => Container(),
                        loading: () => Center(
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
