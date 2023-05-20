import 'package:comet_rail/screens/home_screen/widgets/character_card.dart';
import 'package:comet_rail/services/providers/characters_future_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
            error: (error, stackTrace) => const Center(
              child: Text("Something went wrong"),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
