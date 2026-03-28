import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/size_config.dart';

class AppIcons {
  AppIcons._();

  // ─────── Icon Widget ───────

  static SvgPicture icon(
    BuildContext context, {
    required String path,
    required IconSize size,
    Color? color,
  }) {
    final double iconSize = _getIconSize(context: context, size: size);

    return SvgPicture.asset(
      path,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
      height: iconSize,
      width: iconSize,
    );
  }

  // ─────── Icon Size Logic ───────

  static double _getIconSize({
    required BuildContext context,
    required IconSize size,
  }) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    final bool isMobile = screenWidth <= SizeConfig.tabletBreakPoint;

    switch (size) {
      case IconSize.small:
        return isMobile ? 20.0 : 24.0;
      case IconSize.medium:
        return isMobile ? 24.0 : 32.0;
      case IconSize.large:
        return isMobile ? 36.0 : 48.0;
    }
  }
}
