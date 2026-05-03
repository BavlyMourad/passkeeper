import 'package:flutter/material.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';

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
            colors: Theme.of(context).colorScheme.backgroundGradient,
            begin: begin,
            end: end,
          ),
        ),
        child: child,
      ),
    );
  }
}
