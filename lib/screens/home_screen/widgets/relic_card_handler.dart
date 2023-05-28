import 'dart:math';

import 'package:comet_rail/screens/home_screen/widgets/relic_card.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/providers/character_data_providers/characters_data_provider.dart';
import '../../../services/providers/relic_data_providers/relics_data_provider.dart';

class RelicCardHandler extends ConsumerWidget {
  const RelicCardHandler({super.key, this.index});
  final int? index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(relicsDataProvider).when(
          data: (data) {
            final random = Random();
            final relicData = data.values
                .where((element) => element.name != "")
                .toList()[random.nextInt(data.values.length - 1)];
            return RelicCard(index: index ?? 0, relicData: relicData);
          },
          error: (error, stackTrace) =>
              HttpCallErrorHandler(provider: charactersFutureProvider),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
