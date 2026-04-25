import 'package:flutter/material.dart';
import 'package:passkeeper/core/constants/shared_prefs_keys.dart';
import 'package:passkeeper/core/providers/shared_prefs_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_notifier.g.dart';

@riverpod
class AppThemeNotifier extends _$AppThemeNotifier {
  @override
  ThemeMode build() {
    final prefs = ref.read(sharedPrefsProvider);

    final String? theme = prefs.getString(SharedPrefsKeys.themeMode);

    if (theme != null) {
      return ThemeMode.values.firstWhere(
        (t) => t.name == theme,
        orElse: () => ThemeMode.light,
      );
    }

    return ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final prefs = ref.read(sharedPrefsProvider);

    final bool isDark = state == ThemeMode.dark;

    state = isDark ? ThemeMode.light : ThemeMode.dark;

    await prefs.setString(SharedPrefsKeys.themeMode, state.name);
  }
}
