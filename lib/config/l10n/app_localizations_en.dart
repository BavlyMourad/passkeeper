// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeTo => 'Welcome to';

  @override
  String get loginSubtitle =>
      'Where all of your passwords saved securely in one place';

  @override
  String get loginDescription =>
      'We keep your passwords in a secure private place to simply access them with one click from all your devices';

  @override
  String get loginSetPinButtonLabel => 'Set a PIN';

  @override
  String get loginBiometricInfoText =>
      'Your data will be accessible with any biometric profile registered on this device';

  @override
  String get createPinTitle => 'The only password you need to remember';

  @override
  String get enterPinHint => 'Enter a 6-digit PIN';

  @override
  String get confirmPinHint => 'Confirm PIN';

  @override
  String get enableBiometric => 'Enable biometric login';

  @override
  String get confirmButton => 'Confirm';
}
