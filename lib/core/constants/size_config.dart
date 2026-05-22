class SizeConfig {
  SizeConfig._();

  // ─────── Breakpoints ───────
  static const double tabletBreakPoint = 700.0;

  // ─────── Font Scaling ───────
  static const double mobileScalePoint = 360.0;
  static const double tabletScalePoint = 744.0;

  // ─────── Helpers ───────

  /// Horizontal screen padding for content sections.
  static double horizontalPadding(bool isMobile) => isMobile ? 24.0 : 60.0;

  /// Maximum content width on tablet; full width on mobile.
  static double tabletConstrainedWidth(double screenWidth, bool isMobile) =>
      isMobile ? double.infinity : screenWidth * 0.6;

  /// Vertical spacing between major screen sections.
  static double sectionSpacing(bool isMobile) => isMobile ? 40.0 : 60.0;

  /// Standard height for buttons.
  static double buttonHeight(bool isMobile) => isMobile ? 44.0 : 48.0;
}
