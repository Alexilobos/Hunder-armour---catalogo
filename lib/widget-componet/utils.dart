import 'package:flutter/material.dart';

class UtilsColors {
  static Color getBackgroundColor(String color1) {
    Map<String, Color> colors = {
      'amarillo': Colors.yellow[300]!,
      'azul': Colors.blue,
      'rojo': Colors.red[200]!,
      'verde': Colors.green[300]!,
      'blanco': Colors.white54,
      'negro': Colors.black45,
      'rosado': Colors.pink[300]!,
      'marron': Colors.brown[200]!,
      'morado': Colors.purple[200]!,
      'celeste': Colors.blue[100]!,
      'naranja': Colors.orange,
    };
    return colors[color1.toLowerCase()]!;
  }
}

class UtilsColors2 {
  static Color getBackgroundColor(String color2) {
    Map<String, Color> colors = {
      'amarillo': Colors.yellow[300]!,
      'azul': Colors.blue,
      'rojo': Colors.red[200]!,
      'verde': Colors.green[300]!,
      'blanco': Colors.white54,
      'negro': Colors.black45,
      'rosado': Colors.pink[300]!,
      'marron': Colors.brown[200]!,
      'morado': Colors.purple[200]!,
      'celeste': Colors.blue[100]!,
      'naranja': Colors.orange,
    };
    return colors[color2.toLowerCase()]!;
  }
}