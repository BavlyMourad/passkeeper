import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_logo_bar.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/features/settings/presentation/providers/package_info_provider.dart';
import 'package:passkeeper/features/settings/presentation/widgets/settings_about_section.dart';
import 'package:passkeeper/features/settings/presentation/widgets/settings_preferences_section.dart';
import 'package:passkeeper/features/settings/presentation/widgets/settings_security_section.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);

    return GradientBackground(
      begin: context.isDarkTheme ? Alignment.bottomRight : Alignment.centerLeft,
      end: context.isDarkTheme ? Alignment.topLeft : Alignment.topRight,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppLogoBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.horizontalPadding(context.isMobile),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0),

              Text(
                AppLocalizations.of(context)!.settings,
                style: AppStyles.headlineSemiBold(context),
              ),

              const SizedBox(height: 40.0),

              const SettingsPreferencesSection(),

              const SizedBox(height: 40.0),

              const SettingsSecuritySection(),

              const SizedBox(height: 40.0),

              const SettingsAboutSection(),

              const Spacer(),
              Center(
                child: packageInfo.when(
                  data: (info) => Text(
                    '${AppLocalizations.of(context)!.appVersion}: ${info.version}',
                    style: AppStyles.bodySmallMedium(context),
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, _) => const SizedBox.shrink(),
                ),
              ),

              const SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
