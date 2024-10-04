import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const defaultColor = Colors.redAccent;
  static const defaultDynamicSchemeVariant = DynamicSchemeVariant.vibrant;
  static final defaultLightTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: defaultColor,
      brightness: Brightness.light,
      dynamicSchemeVariant: defaultDynamicSchemeVariant,
    ),
  );
  static final defaultDarkTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: defaultColor,
      brightness: Brightness.dark,
      dynamicSchemeVariant: defaultDynamicSchemeVariant,
    ),
  );
}
