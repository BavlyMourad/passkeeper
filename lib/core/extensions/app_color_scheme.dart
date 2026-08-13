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

  Color get filterChipSelectedBackground =>
      _isDarkTheme ? AppColors.blueLight : AppColors.blueMedium;

  Color get filterChipUnselectedBackground =>
      _isDarkTheme ? AppColors.blueGreyDark : AppColors.greyLightest;

  Color get filterChipSelectedText =>
      _isDarkTheme ? AppColors.blueDark : AppColors.greyLightest;

  Color get filterChipUnselectedText =>
      _isDarkTheme ? AppColors.greyLightest : AppColors.blueMedium;

  Color get actionChipText =>
      _isDarkTheme ? AppColors.greyLightest : AppColors.blueMedium;

  Color get navBarIndicator =>
      AppColors.blueLight.withValues(alpha: _isDarkTheme ? 0.5 : 0.3);

  Color get backButton =>
      _isDarkTheme ? AppColors.greyLightest : AppColors.blueMedium;

  Color get appBarAction =>
      _isDarkTheme ? AppColors.greyLightest : AppColors.blueMedium;

  Color get editButton =>
      _isDarkTheme ? AppColors.greyLightest : AppColors.blueMedium;

  Color get categorySelectField =>
      _isDarkTheme ? AppColors.greyLightest : AppColors.blueMedium;

  Color get chipDeleteIcon =>
      _isDarkTheme ? AppColors.blueDark : AppColors.greyLightest;

  Color get chipAddIcon =>
      _isDarkTheme ? AppColors.greyLightest : AppColors.blueMedium;

  Color get snackBar =>
      _isDarkTheme ? AppColors.blueLight : AppColors.blueMedium;

  Color get cancelButton =>
      _isDarkTheme ? AppColors.greyLightest : AppColors.blueMedium;

  Color get addIconButton =>
      _isDarkTheme ? AppColors.greyLightest : AppColors.blueMedium;

  Color get segmentedButtonSelectedBackground =>
      _isDarkTheme ? AppColors.blueLight : AppColors.blueMedium;

  Color get segmentedButtonUnselectedBackground =>
      _isDarkTheme ? AppColors.blueGreyDark : AppColors.greyLightest;

  Color get segmentedButtonSelectedText =>
      _isDarkTheme ? AppColors.blueDark : AppColors.greyLightest;

  Color get segmentedButtonUnselectedText =>
      _isDarkTheme ? AppColors.greyLightest : AppColors.blueMedium;
}
