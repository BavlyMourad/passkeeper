import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/theme/app_theme_notifier.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/features/settings/presentation/widgets/language_segmented_button.dart';

class SettingsPreferencesSection extends ConsumerWidget {
  const SettingsPreferencesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.preferences,
          style: AppStyles.titleSmallSemiBold(context),
        ),
        const SizedBox(height: 24.0),
        Card(
          margin: const EdgeInsets.all(0),
          child: Center(
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 0.0,
                  ),
                  leading: AppIcon(
                    path: IconPaths.language,
                    size: IconSize.small,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.language,
                    style: AppStyles.bodyRegular(context),
                  ),
                  trailing: const LanguageSegmentedButton(),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 0.0,
                  ),
                  leading: AppIcon(
                    path: IconPaths.darkMode,
                    size: IconSize.small,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.darkMode,
                    style: AppStyles.bodyRegular(context),
                  ),
                  trailing: Switch(
                    value: ref.watch(appThemeProvider) == ThemeMode.dark,
                    onChanged: (_) {
                      ref.read(appThemeProvider.notifier).toggleTheme();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
