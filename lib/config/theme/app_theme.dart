import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
  );
}

ColorScheme _lightColorScheme = const ColorScheme.light(
  primary: Colors.white,
  onPrimary: Color(0xFF141218),
  secondary: Color(0xFFFF5252),
  onSecondary: Colors.white,
  error: Color(0xFFFF5252),
  onError: Colors.white,
  surface: Colors.white,
  onSurface: Color(0xFF141218),
  outline: Color(0xFFFF5252),
);

ColorScheme _darkColorScheme = const ColorScheme.dark(
  primary: Color(0xFF141218),
  onPrimary: Colors.white,
  secondary: Color(0xFFFF5252),
  onSecondary: Colors.white,
  error: Color(0xFFFF5252),
  onError: Colors.white,
  surface: Color(0xFF141218),
  onSurface: Colors.white,
  outline: Colors.white,
);
