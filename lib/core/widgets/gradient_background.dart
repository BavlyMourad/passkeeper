import 'package:flutter/material.dart';
import 'package:passkeeper/config/theme/app_colors.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    required this.begin,
    required this.end,
    required this.child,
  });

  final AlignmentGeometry begin, end;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: context.isDarkTheme
                ? AppColors.darkBackgroundGradientColors
                : AppColors.lightBackgroundGradientColors,
            begin: begin,
            end: end,
          ),
        ),
        child: child,
      ),
    );
  }
}
