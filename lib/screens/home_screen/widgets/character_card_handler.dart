import 'dart:math';

import 'package:comet_rail/screens/home_screen/widgets/character_card.dart';
import 'package:comet_rail/services/providers/characters_future_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CharacterCardHandler extends ConsumerWidget {
  const CharacterCardHandler({super.key, this.index});
  final int? index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(charactersFutureProvider).when(
          data: (data) {
            final random = Random();
            final character = data.characters.values
                .where((element) => element.name != "")
                .toList()[random.nextInt(data.characters.values.length - 1)];
            return CharacterCard(
              character: character,
              index: index ?? 0,
            );
          },
          error: (error, stackTrace) => const Text("Something Went Wrong"),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
