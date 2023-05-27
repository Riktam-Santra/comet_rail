import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ElementIcon extends StatelessWidget {
  final String element;
  const ElementIcon({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    String tempElement = element;
    element == 'Thunder' ? tempElement = 'Lightning' : element;
    return ImageIcon(
      CachedNetworkImageProvider(
          'https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/element/$tempElement.png'),
    );
  }
}
