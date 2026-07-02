import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/config/theme/app_colors.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';

class AddPasswordFab extends StatelessWidget {
  const AddPasswordFab({super.key});

  void navigateToAddPassword(BuildContext context) {
    context.push(AppRoutes.addPassword);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => navigateToAddPassword(context),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      highlightElevation: 0.0,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Theme.of(context).colorScheme.buttonGradient,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: AppIcon(
            path: IconPaths.addPassword,
            size: IconSize.medium,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
