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

  @override
  String get biometricNotAvailable => 'Biometric authentication is unavailable';

  @override
  String get login => 'Login';

  @override
  String get genericError => 'Something went wrong. Please try again';

  @override
  String get pinMismatch => 'PINs do not match. Please try again';

  @override
  String get pinTooShort => 'PIN must be at least 6 digits';

  @override
  String get wrongPin => 'Wrong PIN. Please try again';

  @override
  String get biometricFailed => 'Biometric authentication failed';

  @override
  String get biometricNotEnrolled =>
      'Biometric not set up. Please login with PIN';

  @override
  String get biometricReason => 'Authenticate to access PassKeeper';

  @override
  String get noPasswordsYet =>
      'No secrets here...yet!\nTap the button below to add your first password';

  @override
  String get search => 'Search';

  @override
  String get all => 'All';

  @override
  String get back => 'Back';

  @override
  String get view => 'View';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get titleHint => 'Title';

  @override
  String get usernameHint => 'Email, Username, etc...';

  @override
  String get passwordHint => 'Password';

  @override
  String get confirmPasswordHint => 'Confirm Password';

  @override
  String get categoryHint => 'Category';

  @override
  String get websiteHint => 'Website';

  @override
  String get addNewCategory => 'Add New Category';

  @override
  String get addPassword => 'Add Password';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get optional => ' (Optional)';

  @override
  String get passwordMismatch => 'Passwords do not match. Please try again';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get sessionExpired => 'Your session has expired. Please log in again';

  @override
  String get passwordSaved => 'Password saved';
}
