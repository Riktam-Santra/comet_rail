import 'package:flutter/material.dart';

List<Widget> rarityIndicator(int rarity) {
  switch (rarity) {
    case 1:
      return [
        ImageIcon(
          const AssetImage('assets/star.png'),
          color: Colors.grey[700],
        )
      ];

    case 2:
      return [
        for (int i = 0; i < 2; i++)
          ImageIcon(
            const AssetImage('assets/star.png'),
            color: Colors.teal[800],
          )
      ];

    case 3:
      return [
        for (int i = 0; i < 3; i++)
          ImageIcon(
            const AssetImage('assets/star.png'),
            color: Colors.blue[800],
          )
      ];

    case 4:
      return [
        for (int i = 0; i < 4; i++)
          ImageIcon(
            const AssetImage('assets/star.png'),
            color: Colors.purple[800],
          )
      ];

    case 5:
      return [
        for (int i = 0; i < 5; i++)
          ImageIcon(
            const AssetImage('assets/star.png'),
            color: Colors.yellow[800],
          )
      ];

    default:
      return [];
  }
}
