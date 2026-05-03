import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/theme/app_theme_notifier.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      onPressed: () => ref.read(appThemeProvider.notifier).toggleTheme(),
      icon: AppIcon(
        path: context.isDarkTheme ? IconPaths.lightMode : IconPaths.darkMode,
        size: IconSize.small,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}
