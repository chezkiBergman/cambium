import 'package:flutter/material.dart';

class CustomColors {
  static const Color orange = Color(0xFFFD7F41);
  static const Color darkBlue = Color(0xFF0A0043);
  static const Color mintGreen = Color(0xFF7FD8BD);
  static const Color backgroundColorApp = Color(0xFFFFEBD8);

  static const List<Color> gradientColors = [
    orange,
    darkBlue,
    mintGreen,
  ];

  static Color mixColors(List<Color> colors) {
    if (colors.isEmpty) return Colors.transparent;

    int r = 0, g = 0, b = 0;
    for (var color in colors) {
      r += color.red;
      g += color.green;
      b += color.blue;
    }

    int count = colors.length;
    return Color.fromARGB(255, r ~/ count, g ~/ count, b ~/ count);
  }
}
