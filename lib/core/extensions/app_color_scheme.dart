import 'package:flutter/material.dart';
import 'package:passkeeper/config/theme/app_colors.dart';

extension AppColorScheme on ColorScheme {
  bool get _isDarkTheme => brightness == Brightness.dark;

  Color get bottomSheetBackground =>
      _isDarkTheme ? AppColors.blueGreyMedium : AppColors.blueLightest;

  List<Color> get buttonGradient => _isDarkTheme
      ? AppColors.darkButtonGradientColors
      : AppColors.lightButtonGradientColors;

  List<Color> get backgroundGradient => _isDarkTheme
      ? AppColors.darkBackgroundGradientColors
      : AppColors.lightBackgroundGradientColors;

  Color get activeChipBackground =>
      _isDarkTheme ? AppColors.blueLight : AppColors.blueMedium;

  Color get inactiveChipBackground =>
      _isDarkTheme ? AppColors.blueGreyDark : AppColors.greyLightest;

  Color get activeChipText =>
      _isDarkTheme ? AppColors.blueDark : AppColors.greyLightest;

  Color get inactiveChipText =>
      _isDarkTheme ? AppColors.greyLight : AppColors.blueMedium;

  Color get navBarIndicator =>
      AppColors.blueLight.withValues(alpha: _isDarkTheme ? 0.5 : 0.3);
}
