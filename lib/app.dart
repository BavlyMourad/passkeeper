import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_language_notifier.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/l10n/app_localizations_callback.dart';
import 'package:passkeeper/config/routes/app_router.dart';
import 'package:passkeeper/config/theme/app_theme_notifier.dart';
import 'package:passkeeper/core/constants/app_strings.dart';
import 'package:passkeeper/core/security/vault_lock_manager.dart';

import 'config/theme/app_theme.dart';

class PassKeeperApp extends ConsumerWidget {
  const PassKeeperApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(vaultLockManagerProvider);

    final lang = ref.watch(appLanguageProvider);
    final themeMode = ref.watch(appThemeProvider);
    final router = ref.watch(appRouterProvider);

    return Listener(
      onPointerDown: (_) {
        ref.read(vaultLockManagerProvider.notifier).recordActivity();
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        routerConfig: router,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeMode,
        locale: lang.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        localeResolutionCallback: (locales, supportedLocales) =>
            AppLocalizationsCallback.localeResolutionCallback(
              locales,
              supportedLocales,
            ),
      ),
    );
  }
}
