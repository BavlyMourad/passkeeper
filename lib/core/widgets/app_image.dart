import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.path,
    required this.mobileSize,
    required this.tabletSize,
    this.color,
  });

  final String path;
  final double mobileSize;
  final double tabletSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final double size = context.isMobile ? mobileSize : tabletSize;

    return SvgPicture.asset(
      path,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      height: size,
      width: size,
    );
  }
}
