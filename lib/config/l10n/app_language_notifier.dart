import 'package:passkeeper/core/providers/shared_prefs_provider.dart';
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

  Future<void> setLanguage(AppLanguage language) async {
    final prefs = ref.read(sharedPrefsProvider);

    state = language;

    await prefs.setString(SharedPrefsKeys.language, language.code);
  }
}
