import 'package:passkeeper/core/providers/shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/shared_prefs_keys.dart';

part 'app_language_notifier.g.dart';

@riverpod
class AppLanguageNotifier extends _$AppLanguageNotifier {
  @override
  AppLanguage build() {
    final prefs = ref.read(sharedPrefsProvider);

    final String? lang = prefs.getString(SharedPrefsKeys.language);

    if (lang != null) {
      return AppLanguage.values.firstWhere(
        (language) => language.code == lang,
        orElse: () => AppLanguage.en,
      );
    }

    return AppLanguage.en;
  }

  Future<void> toggleLanguage() async {
    final prefs = ref.read(sharedPrefsProvider);

    final bool isEnglish = state == AppLanguage.en;

    state = isEnglish ? AppLanguage.ar : AppLanguage.en;

    await prefs.setString(SharedPrefsKeys.language, state.code);
  }

  Future<void> setLanguage(AppLanguage language) async {
    final prefs = ref.read(sharedPrefsProvider);

    state = language;

    await prefs.setString(SharedPrefsKeys.language, language.code);
  }

  // Get the other language
  String get otherLanguage => state == AppLanguage.en
      ? AppLanguage.ar.code.toUpperCase()
      : AppLanguage.en.code.toUpperCase();
}
