import 'package:comet_rail/screens/home_screen/widgets/character_card.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../services/providers/character_data_providers/characters_data_provider.dart';

class AllCharactersScreen extends ConsumerWidget {
  const AllCharactersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters"),
      ),
      body: ref.watch(charactersFutureProvider).when(
            data: (data) {
              final characterList = data.characters.values
                  .where((element) => element.name != "")
                  .toList();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: characterList.length,
                  itemBuilder: (context, index) => CharacterCard(
                    character: characterList[index],
                    index: index,
                  ),
                ),
              );
            },
            error: (error, stackTrace) =>
                HttpCallErrorHandler(provider: charactersFutureProvider),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
