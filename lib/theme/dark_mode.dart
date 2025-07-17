import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey[900]!,
    brightness: Brightness.dark,
    primary: Colors.white,
    secondary: Colors.grey[700]!,
    tertiary: Colors.grey[800]!,
    inversePrimary: Colors.grey.shade300,
  )
);