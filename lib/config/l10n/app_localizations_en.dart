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
  String get noFavouritePasswordsYet => 'No favourite passwords...yet!';

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

  @override
  String get favourites => 'Favourites';

  @override
  String get copied => 'Copied';

  @override
  String get noMatchingPasswordsFound => 'No matching passwords found';

  @override
  String get passwordDeleted => 'Password deleted';

  @override
  String get cancel => 'Cancel';

  @override
  String get actionCanNotBeUndone => 'This action cannot be undone';

  @override
  String get confirmDeletePassword => 'Delete Password?';

  @override
  String get confirmDeleteCategory => 'Delete Category?';

  @override
  String get settings => 'Settings';

  @override
  String get preferences => 'Preferences';

  @override
  String get language => 'Language';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get security => 'Security';

  @override
  String get biometricLogin => 'Biometric login';

  @override
  String get about => 'About';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get appVersion => 'App version';

  @override
  String get categorySaved => 'Category saved';

  @override
  String get categoryDeleted => 'Category deleted';

  @override
  String get passwords => 'Passwords';

  @override
  String get categories => 'Categories';

  @override
  String get createNew => 'Create New';

  @override
  String get create => 'Create';

  @override
  String get categoryNameExists => 'This category name exists';

  @override
  String get categoryNameEmpty => 'Please enter a category name';

  @override
  String get categoryName => 'Category name';

  @override
  String get empty => 'Empty';

  @override
  String get privacyPolicyLastUpdated => 'Last updated: August 2026';

  @override
  String get privacyPolicyIntro =>
      'PassKeeper is designed to keep your data on your device, not on our servers. This policy explains what that means in practice.';

  @override
  String get privacyPolicyWhatWeCollectTitle => 'What We Collect';

  @override
  String get privacyPolicyWhatWeCollectBody =>
      'Nothing. PassKeeper does not collect, transmit, or store any of your data on external servers. We have no analytics, no tracking, and no account system.';

  @override
  String get privacyPolicyDataLocationTitle => 'Where Your Data Lives';

  @override
  String get privacyPolicyDataLocationBody =>
      'All passwords, categories, and settings are stored locally on your device. Your passwords are encrypted using AES-256-GCM before they touch storage, with a unique encryption key derived from your PIN.';

  @override
  String get privacyPolicyBiometricTitle => 'Biometric Authentication';

  @override
  String get privacyPolicyBiometricBody =>
      'If you enable fingerprint or face unlock, this is handled entirely by your device\'s operating system. PassKeeper never receives or stores your biometric data.';

  @override
  String get privacyPolicyBackupsTitle => 'Backups';

  @override
  String get privacyPolicyBackupsBody =>
      'PassKeeper does not back up your data automatically. If your device backs up app data to a cloud service, that backup is subject to that service\'s own encryption and privacy terms, not ours.';

  @override
  String get privacyPolicyDeletingDataTitle => 'Deleting Your Data';

  @override
  String get privacyPolicyDeletingDataBody =>
      'Uninstalling PassKeeper permanently deletes all locally stored data. Since we never had a copy, there is nothing further to delete on our end.';

  @override
  String get privacyPolicyChangesTitle => 'Changes to This Policy';

  @override
  String get privacyPolicyChangesBody =>
      'If this policy changes, we will update the date above and, for any material change, notify you within the app.';

  @override
  String get privacyPolicyContactTitle => 'Contact';

  @override
  String get privacyPolicyContactBody =>
      'Questions about this policy can be sent to bavleymourad@gmail.com.';
}
