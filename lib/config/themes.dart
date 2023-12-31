import 'package:flutter/material.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, brightness: Brightness.light));

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue, //const Color.fromRGBO(28, 110, 221, 1),
        primaryContainer: Colors.blue,
        brightness: Brightness.dark),
  );
}


//colorSchemeSeed: Color.fromRGBO(188, 0, 74, 1.0);