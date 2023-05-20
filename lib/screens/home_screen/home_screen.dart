import 'package:comet_rail/screens/all_characters_screen/all_characters_screen.dart';
import 'package:comet_rail/screens/home_screen/widgets/character_card_handler.dart';
import 'package:comet_rail/screens/home_screen/widgets/items_list.dart';
import 'package:comet_rail/screens/home_screen/widgets/light_cone_card_handler.dart';
import 'package:comet_rail/screens/home_screen/widgets/relic_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final logoGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 227, 210, 174),
      Color.fromARGB(255, 115, 122, 163),
      Color.fromARGB(255, 81, 148, 198),
    ],
  );
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => logoGradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: Text(
                  "Comet Rail",
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Text(
                "Your one stop for everything Star Rail related",
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CharacterCardHandler(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllCharactersScreen(),
                      ),
                    );
                  },
                  child: const Text("View All Characters"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Light Cones",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: LightConeCardHandler(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: FilledButton(
                  onPressed: () {},
                  child: const Text("View All Light Cones"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Items",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ItemsList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: FilledButton(
                  onPressed: () {},
                  child: const Text("View All Items"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                "Relics",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: RelicCard(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: FilledButton(
                  onPressed: () {},
                  child: const Text("View All Relics"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
