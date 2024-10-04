import 'package:flutter/material.dart';

class PokemonColor {
  static const black = Colors.black;
  static const blue = Colors.blue;
  static const brown = Colors.brown;
  static const gray = Colors.grey;
  static const green = Colors.green;
  static const pink = Colors.pink;
  static const purple = Colors.purple;
  static const red = Colors.red;
  static const white = Colors.white;
  static const yellow = Colors.yellow;

  static Color getColor(String type) {
    switch (type) {
      case 'black':
        return black;
      case 'blue':
        return blue;
      case 'brown':
        return brown;
      case 'gray':
        return gray;
      case 'green':
        return green;
      case 'pink':
        return pink;
      case 'purple':
        return purple;
      case 'red':
        return red;
      case 'white':
        return white;
      case 'yellow':
        return yellow;
      default:
        return white;
    }
  }
}
