import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_language_notifier.dart';
import 'package:passkeeper/core/assets/app_icons.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';

class LanguageSelectionButton extends ConsumerWidget {
  const LanguageSelectionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      onPressed: () {
        ref.read(appLanguageProvider.notifier).toggleLanguage();
      },
      icon: Row(
        children: [
          AppIcons.icon(
            context,
            path: IconPaths.language,
            size: IconSize.small,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const SizedBox(width: 2.0),
          Text(
            ref.watch(appLanguageProvider.notifier).otherLanguage,
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
        ],
      ),
    );
  }
}
