import 'package:flutter/material.dart';
import 'package:passkeeper/core/constants/size_config.dart';

class AppStyles {
  AppStyles._();

  // TODO: Switch font family based on locale
  static const String fontFamily = 'Montserrat';

  // ─────── Text Styles ───────

  static TextStyle displaySemiBold(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 40.0,
      tabletBaseFontSize: 60.0,
    ),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle headlineSemiBold(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 24.0,
      tabletBaseFontSize: 36.0,
    ),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle titleLargeSemiBold(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 20.0,
      tabletBaseFontSize: 32.0,
    ),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle titleLargeRegular(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 20.0,
      tabletBaseFontSize: 32.0,
    ),
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle titleMediumSemiBold(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 16.0,
      tabletBaseFontSize: 20.0,
    ),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle titleMedium(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 16.0,
      tabletBaseFontSize: 20.0,
    ),
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle titleSmallSemiBold(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 14.0,
      tabletBaseFontSize: 16.0,
    ),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle bodyRegular(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 14.0,
      tabletBaseFontSize: 20.0,
    ),
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle bodySmallMedium(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 12.0,
      tabletBaseFontSize: 14.0,
    ),
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle bodySmallSemiBold(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 12.0,
      tabletBaseFontSize: 14.0,
    ),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle captionMedium(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 10.0,
      tabletBaseFontSize: 12.0,
    ),
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle captionRegular(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: _getResponsiveText(
      context: context,
      mobileBaseFontSize: 10.0,
      tabletBaseFontSize: 12.0,
    ),
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.onSurface,
  );

  // ─────── Responsive Logic ───────

  static double _getResponsiveText({
    required BuildContext context,
    required double mobileBaseFontSize,
    required double tabletBaseFontSize,
  }) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double scaleFactor = _getScaleFactor(context: context);

    final bool isMobile = screenWidth <= SizeConfig.tabletBreakPoint;
    final double baseFontSize = isMobile
        ? mobileBaseFontSize
        : tabletBaseFontSize;

    double responsiveFontSize = baseFontSize * scaleFactor;

    double lowerLimit = baseFontSize * 0.8;
    double upperLimit = baseFontSize * 1.2;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double _getScaleFactor({required BuildContext context}) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    if (screenWidth <= SizeConfig.tabletBreakPoint) {
      return screenWidth / SizeConfig.mobileScalePoint;
    } else {
      return screenWidth / SizeConfig.tabletScalePoint;
    }
  }
}
