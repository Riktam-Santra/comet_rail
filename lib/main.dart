import 'package:comet_rail/screens/character_builder_screen/character_builder_screen.dart';
import 'package:comet_rail/screens/home_screen/home_screen.dart';
import 'package:comet_rail/screens/search_screen/search_screen.dart';
import 'package:comet_rail/screens/widgets/custom_botom_navigation_bar.dart';
import 'package:comet_rail/services/providers/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  final PageController _pageController = PageController();
  MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(useMaterial3: true),
      themeMode: ref.watch(darkModeProvider) ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ref.read(darkModeProvider.notifier).toggle();
            },
            child: ref.watch(darkModeProvider)
                ? const Icon(
                    Icons.light_mode,
                  )
                : const Icon(
                    Icons.dark_mode,
                  ),
          ),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              const HomeScreen(),
              SearchScreen(),
              const CharacterBuilderScreen(),
            ],
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            controller: _pageController,
          )),
    );
  }
}
