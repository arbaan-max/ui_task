import 'package:flutter/material.dart';

class CustomColors {
  // Private constructor
  CustomColors._internal();
  // Singleton instance
  static final CustomColors _instance = CustomColors._internal();
  // Factory constructor to return the same instance
  factory CustomColors() {
    return _instance;
  }

  // Define your colors as constants
  static const Color primary = Color(0xff080450);
  static const Color background = Color(0xffF5F6FB);
  static const Color secondary = Color(0xffffffff);
  static const Color ternary = Color(0xff6BC75C);
  static const Color grey = Color(0xff707070);
  static const Color textFieldBorder = Colors.black12;
}

/// Creates a [MaterialColor] swatch from a base color.
///
/// The swatch consists of different shades of the base color.
MaterialColor createMaterialColor(Color color) {
  List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  // Generate a list of strengths for the swatch
  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  // Generate the colors for each strength
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  // Return the MaterialColor swatch
  return MaterialColor(color.value, swatch);
}
