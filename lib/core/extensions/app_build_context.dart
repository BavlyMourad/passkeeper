import 'package:flutter/material.dart';
import 'package:passkeeper/core/constants/size_config.dart';

extension AppBuildContext on BuildContext {
  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  bool get isMobile => screenWidth <= SizeConfig.tabletBreakPoint;
}
