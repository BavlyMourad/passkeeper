import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.path,
    required this.size,
    this.color,
  });

  final String path;
  final IconSize size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final double iconSize = switch (size) {
      IconSize.smallest => context.isMobile ? 16.0 : 20.0,
      IconSize.small => context.isMobile ? 20.0 : 24.0,
      IconSize.medium => context.isMobile ? 24.0 : 32.0,
      IconSize.large => context.isMobile ? 36.0 : 48.0,
      IconSize.largest => context.isMobile ? 60.0 : 72.0,
    };

    return SvgPicture.asset(
      path,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      height: iconSize,
      width: iconSize,
    );
  }
}
