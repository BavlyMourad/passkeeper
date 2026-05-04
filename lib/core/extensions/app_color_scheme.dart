import 'package:flutter/material.dart';
import 'package:passkeeper/config/theme/app_colors.dart';

extension AppColorScheme on ColorScheme {
  bool get _isDarkTheme => brightness == Brightness.dark;

  Color get buttonTextColor => AppColors.greyLightest;

  Color get bottomSheetBackground =>
      _isDarkTheme ? AppColors.blueGreyMedium : AppColors.blueLightest;

  List<Color> get buttonGradient => _isDarkTheme
      ? AppColors.darkButtonGradientColors
      : AppColors.lightButtonGradientColors;

  List<Color> get backgroundGradient => _isDarkTheme
      ? AppColors.darkBackgroundGradientColors
      : AppColors.lightBackgroundGradientColors;
}
