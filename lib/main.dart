import 'package:comet_rail/screens/home_screen/home_screen.dart';
import 'package:comet_rail/services/providers/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
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
              ? Icon(
                  Icons.light_mode,
                )
              : Icon(
                  Icons.dark_mode,
                ),
        ),
        body: HomeScreen(),
      ),
    );
  }
}
