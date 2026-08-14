import 'package:flutter/material.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';

class PasswordIcon extends StatelessWidget {
  const PasswordIcon({super.key, this.logoPath, required this.size});

  final String? logoPath;
  final IconSize size;

  @override
  Widget build(BuildContext context) {
    if (logoPath != null) {
      return AppIcon(path: logoPath!, size: size);
    }

    return AppIcon(
      path: IconPaths.password,
      size: size,
      color: Theme.of(context).colorScheme.onSecondary,
    );
  }
}
