import 'package:flutter/material.dart';

extension AppBuildContext on BuildContext {
  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;
}
