class SizeConfig {
  SizeConfig._();

  // ─────── Breakpoints ───────
  static const double tabletBreakPoint = 700.0;

  // ─────── Font Scaling ───────
  static const double mobileScalePoint = 360.0;
  static const double tabletScalePoint = 744.0;

  // ─────── Layout ───────
  static const double _horizontalPaddingMobile = 24.0;
  static const double _horizontalPaddingTablet = 60.0;

  // 60% of screen width
  static const double _tabletConstrainedWidthFactor = 0.6;

  static const double _sectionSpacingMobile = 40.0;
  static const double _sectionSpacingTablet = 60.0;

  static const double _buttonHeightMobile = 44.0;
  static const double _buttonHeightTablet = 48.0;

  static const double _textFieldHeightMobile = 44.0;
  static const double _textFieldHeightTablet = 48.0;

  // ─────── Helpers ───────
  static double horizontalPadding(bool isMobile) =>
      isMobile ? _horizontalPaddingMobile : _horizontalPaddingTablet;

  static double tabletConstrainedWidth(double screenWidth, bool isMobile) =>
      isMobile ? double.infinity : screenWidth * _tabletConstrainedWidthFactor;

  static double sectionSpacing(bool isMobile) =>
      isMobile ? _sectionSpacingMobile : _sectionSpacingTablet;

  static double buttonHeight(bool isMobile) =>
      isMobile ? _buttonHeightMobile : _buttonHeightTablet;

  static double textFieldHeight(bool isMobile) =>
      isMobile ? _textFieldHeightMobile : _textFieldHeightTablet;
}
