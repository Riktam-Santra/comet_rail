import 'dart:math';

import 'package:comet_rail/screens/home_screen/widgets/light_cone_card.dart';
import 'package:comet_rail/screens/widgets/http_call_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/providers/light_cone_data_providers/light_cone_data_provider.dart';

class LightConeCardHandler extends ConsumerWidget {
  final int? index;
  const LightConeCardHandler({
    super.key,
    this.index,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(lightConeDataProvider).when(
          data: (data) {
            final random = Random();
            final lightCode = data.values
                .where((element) => element.name != "")
                .toList()[random.nextInt(data.values.length - 1)];
            return LightConeCard(
              lightConeData: lightCode,
              index: 0,
            );
          },
          error: (error, stackTrace) =>
              HttpCallErrorHandler(provider: lightConeDataProvider),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
