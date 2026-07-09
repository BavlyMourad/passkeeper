import 'dart:ui';

enum IconSize { small, medium, large }

enum AppLanguage {
  ar('العربية', 'ar'),
  en('English', 'en');

  final String text;
  final String code;

  const AppLanguage(this.text, this.code);

  Locale get locale => Locale(code); // Converts to Flutter Locale
}

// Which tab navigated to the password details screen so it gets highlighted
enum PasswordDetailsSource { passwords, favourites }
