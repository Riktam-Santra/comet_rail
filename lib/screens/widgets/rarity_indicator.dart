import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RarityIndicator extends ConsumerWidget {
  final int rarity;
  const RarityIndicator({super.key, required this.rarity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (rarity) {
      case 1:
        return Row(
          children: [
            ImageIcon(
              const AssetImage('assets/star.png'),
              color: Colors.grey[700],
            )
          ],
        );

      case 2:
        return Row(
          children: [
            for (int i = 0; i < 2; i++)
              ImageIcon(
                const AssetImage('assets/star.png'),
                color: Colors.teal[800],
              )
          ],
        );

      case 3:
        return Row(
          children: [
            for (int i = 0; i < 3; i++)
              ImageIcon(
                const AssetImage('assets/star.png'),
                color: Colors.blue[800],
              )
          ],
        );

      case 4:
        return Row(
          children: [
            for (int i = 0; i < 4; i++)
              ImageIcon(
                const AssetImage('assets/star.png'),
                color: Colors.purple[800],
              )
          ],
        );

      case 5:
        return Row(
          children: [
            for (int i = 0; i < 5; i++)
              ImageIcon(
                const AssetImage('assets/star.png'),
                color: Colors.yellow[800],
              )
          ],
        );

      default:
        return Container();
    }
  }
}
