import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';

class SettingsAboutSection extends ConsumerWidget {
  const SettingsAboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.about,
          style: AppStyles.titleSmallSemiBold(context),
        ),
        const SizedBox(height: 24.0),
        Card(
          margin: const EdgeInsets.all(0),
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => context.push(AppRoutes.privacyPolicy),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 0.0,
                    ),
                    leading: AppIcon(
                      path: IconPaths.privacyPolicy,
                      size: IconSize.small,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.privacyPolicy,
                      style: AppStyles.bodyRegular(context),
                    ),
                    trailing: Transform.flip(
                      flipX: Directionality.of(context) == TextDirection.ltr,
                      child: AppIcon(
                        path: IconPaths.back,
                        size: IconSize.small,
                        color: Theme.of(context).colorScheme.backButton,
                      ),
                    ),
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
