import 'package:carousel_slider/carousel_slider.dart';
import 'package:comet_rail/screens/character_builder_screen/widgets/planar_selector_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/character_selector_card/character_selector_card.dart';
import 'widgets/light_cone_selector_card.dart';
import 'widgets/relic_selector_card.dart';

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
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  "Character",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const CharacterSelectorCard(),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  "Light Cone",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const LightConeSelectorCard(),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  "Relics",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                    enableInfiniteScroll: false,
                    aspectRatio: 0.6,
                    viewportFraction: 0.9),
                items: const [
                  RelicSelectorCard(
                    index: 0,
                  ),
                  RelicSelectorCard(
                    index: 1,
                  ),
                  RelicSelectorCard(
                    index: 2,
                  ),
                  RelicSelectorCard(
                    index: 3,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  "Planars",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                    enableInfiniteScroll: false,
                    aspectRatio: 0.6,
                    viewportFraction: 0.9),
                items: const [
                  PlanarSelectorCard(
                    index: 0,
                  ),
                  PlanarSelectorCard(
                    index: 1,
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.calculate_rounded),
                      label: const Text("Calculate Damage")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
