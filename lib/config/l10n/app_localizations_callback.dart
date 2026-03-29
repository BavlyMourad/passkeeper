import 'package:flutter/material.dart';

class AppLocalizationsCallback {
  // Receive device locale and match it with app supported locales
  static Locale localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale == null) {
      return supportedLocales.last;
    }

    for (var supportedLocale in supportedLocales) {
      if (locale.languageCode == supportedLocale.languageCode) {
        return supportedLocale;
      }
    }

    return supportedLocales.last;
  }
}
