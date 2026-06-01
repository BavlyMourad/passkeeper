import 'package:flutter/material.dart';
import 'package:passkeeper/config/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: AppColors.greyLightest,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greyLightest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.redSoft, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.redSoft, width: 1.5),
      ),
    ),
    switchTheme: SwitchThemeData(
      // Returns the same value no matter what state the widget is in.
      thumbColor: WidgetStateProperty.all(AppColors.greyLightest),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.blueMedium;
        }
        return AppColors.greyLight;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.transparent;
        }
        return AppColors.greyLightest;
      }),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.blueGreyDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.redSoft, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: AppColors.redSoft, width: 1.5),
      ),
    ),

    switchTheme: SwitchThemeData(
      // Returns the same value no matter what state the widget is in.
      thumbColor: WidgetStateProperty.all(AppColors.greyLightest),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.blueLight;
        }
        return AppColors.greyLight;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.transparent;
        }
        return AppColors.greyLightest;
      }),
    ),
  );

  static const _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    // Primary
    primary: AppColors.blueMedium, // Switch track (on)
    onPrimary: AppColors.greyDark, // Text on button / Switch thumb (on)
    primaryContainer: AppColors.blueDark, //? Button gradient end
    onPrimaryContainer: AppColors.white, //? Text on primary container
    // Secondary
    secondary: AppColors.blueLight,
    onSecondary: AppColors.blueMedium, // Secondary icons
    secondaryContainer: AppColors.white,
    onSecondaryContainer: AppColors.greyDark, //? Text on secondary container
    // Tertiary
    tertiary: AppColors.blueGreyMedium, //? Overlay background
    onTertiary: AppColors.white, //? Text on overlay
    tertiaryContainer: AppColors.blueLightest, //? Light overlay variant
    onTertiaryContainer: AppColors.greyDark, //? Text on light overlay
    // Surface
    surface: AppColors.greyLightest, // Card background / Navbar / Chip
    onSurface: AppColors.greyDark, // Text
    surfaceContainerHighest: AppColors.greyLight, // Switch track (off)
    // Error
    error: AppColors.redSoft, //? Error state
    onError: AppColors.white, //? Text on error
    errorContainer: AppColors.redSoft, //? Error container
    onErrorContainer: AppColors.white, //? Text on error container
    // Outline
    outline: AppColors.greyLight, // Switch border (off)
    outlineVariant: Colors.transparent, // Chip border
    // Inverse
    inverseSurface: AppColors.greyDark, //? Snackbar background
    onInverseSurface: AppColors.white, //? Snackbar text
    inversePrimary: AppColors.blueLight, //? Inverse primary action
    // Shadow / scrim
    shadow: AppColors.black, //? Shadows
    scrim: AppColors.black, //? Modal scrim
  );

  static const _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    // Primary
    primary: AppColors.blueLight, // Switch track (on)
    onPrimary: AppColors.greyLightest, // Text on button / Switch thumb (on)
    primaryContainer: AppColors.blueMedium, //? Button gradient end
    onPrimaryContainer: AppColors.white, //? Text on primary container
    // Secondary
    secondary: AppColors.blueLight,
    onSecondary: AppColors.greyLightest, // Secondary icons
    secondaryContainer: AppColors.blueMedium,
    onSecondaryContainer: AppColors.white, //? Text on secondary container
    // Tertiary
    tertiary: AppColors.blueGreyMedium, //? Overlay background
    onTertiary: AppColors.greyLightest, //? Text on overlay
    tertiaryContainer: AppColors.blueGreyDark, //? Dark overlay variant
    onTertiaryContainer: AppColors.greyLight, //? Text on dark overlay
    // Surface
    surface: AppColors.blueGreyDark, // Card background / Navbar / Chip
    onSurface: AppColors.greyLightest, // Text
    surfaceContainerHighest: AppColors.blueGreyMedium, // Switch track (off)
    // Error
    error: AppColors.redSoft, //? Error state
    onError: AppColors.white, //? Text on error
    errorContainer: AppColors.redSoft, //? Error container
    onErrorContainer: AppColors.white, //? Text on error container
    // Outline
    outline: AppColors.blueGreyMedium, // Switch border (off)
    outlineVariant: Colors.transparent, // Chip border
    // Inverse
    inverseSurface: AppColors.greyLightest, //? Snackbar background
    onInverseSurface: AppColors.greyDark, //? Snackbar text
    inversePrimary: AppColors.blueMedium, //? Inverse primary action
    // Shadow / scrim
    shadow: AppColors.black, //? Shadows
    scrim: AppColors.black, //? Modal scrim
  );
}
