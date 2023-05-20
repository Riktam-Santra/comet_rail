import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget elementIcon(String element) {
  element == 'Thunder' ? element = 'Lightning' : element;
  return ImageIcon(
    CachedNetworkImageProvider(
        'https://raw.githubusercontent.com/Mar-7th/StarRailRes/master/icon/element/$element.png'),
  );
}
