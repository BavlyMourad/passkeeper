import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color blueLightest = Color(0xFFBAD4E7);
  static const Color blueLight = Color(0xFF82B7DC);
  static const Color blueMedium = Color(0xFF3466AA);
  static const Color blueDark = Color(0xFF114084);

  static const Color blueGreyMedium = Color(0xFF3F5C7E);
  static const Color blueGreyDark = Color(0xFF2E4566);

  static const Color greyLightest = Color(0xFFF1F1F1);
  static const Color greyLight = Color(0xFFC9D1D9);
  static const Color greyDark = Color(0xFF1C1C1C);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color redSoft = Color(0xFFFF6B6B);

  static const List<Color> lightBackgroundGradientColors = [
    Color(0xFFDBE5ED),
    Color(0xFF6A87AF),
  ];
  static const List<Color> darkBackgroundGradientColors = [
    Color(0xFF1B262E),
    Color(0xFF172F4C),
  ];

  static const List<Color> lightButtonGradientColors = [blueMedium, blueDark];

  static const List<Color> darkButtonGradientColors = [blueLight, blueMedium];
}
