import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @welcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get welcomeTo;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Where all of your passwords saved securely in one place'**
  String get loginSubtitle;

  /// No description provided for @loginDescription.
  ///
  /// In en, this message translates to:
  /// **'We keep your passwords in a secure private place to simply access them with one click from all your devices'**
  String get loginDescription;

  /// No description provided for @loginSetPinButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Set a PIN'**
  String get loginSetPinButtonLabel;

  /// No description provided for @loginBiometricInfoText.
  ///
  /// In en, this message translates to:
  /// **'Your data will be accessible with any biometric profile registered on this device'**
  String get loginBiometricInfoText;

  /// No description provided for @createPinTitle.
  ///
  /// In en, this message translates to:
  /// **'The only password you need to remember'**
  String get createPinTitle;

  /// No description provided for @enterPinHint.
  ///
  /// In en, this message translates to:
  /// **'Enter a 6-digit PIN'**
  String get enterPinHint;

  /// No description provided for @confirmPinHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm PIN'**
  String get confirmPinHint;

  /// No description provided for @enableBiometric.
  ///
  /// In en, this message translates to:
  /// **'Enable biometric login'**
  String get enableBiometric;

  /// No description provided for @confirmButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmButton;

  /// No description provided for @biometricNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Biometric authentication is unavailable'**
  String get biometricNotAvailable;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again'**
  String get genericError;

  /// No description provided for @pinMismatch.
  ///
  /// In en, this message translates to:
  /// **'PINs do not match. Please try again'**
  String get pinMismatch;

  /// No description provided for @pinTooShort.
  ///
  /// In en, this message translates to:
  /// **'PIN must be at least 6 digits'**
  String get pinTooShort;

  /// No description provided for @wrongPin.
  ///
  /// In en, this message translates to:
  /// **'Wrong PIN. Please try again'**
  String get wrongPin;

  /// No description provided for @biometricFailed.
  ///
  /// In en, this message translates to:
  /// **'Biometric authentication failed'**
  String get biometricFailed;

  /// No description provided for @biometricNotEnrolled.
  ///
  /// In en, this message translates to:
  /// **'Biometric not set up. Please login with PIN'**
  String get biometricNotEnrolled;

  /// No description provided for @biometricReason.
  ///
  /// In en, this message translates to:
  /// **'Authenticate to access PassKeeper'**
  String get biometricReason;

  /// No description provided for @noPasswordsYet.
  ///
  /// In en, this message translates to:
  /// **'No secrets here...yet!\nTap the button below to add your first password'**
  String get noPasswordsYet;

  /// No description provided for @noFavouritePasswordsYet.
  ///
  /// In en, this message translates to:
  /// **'No favourite passwords...yet!'**
  String get noFavouritePasswordsYet;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @titleHint.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get titleHint;

  /// No description provided for @usernameHint.
  ///
  /// In en, this message translates to:
  /// **'Email, Username, etc...'**
  String get usernameHint;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordHint;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordHint;

  /// No description provided for @categoryHint.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get categoryHint;

  /// No description provided for @websiteHint.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get websiteHint;

  /// No description provided for @addNewCategory.
  ///
  /// In en, this message translates to:
  /// **'Add New Category'**
  String get addNewCategory;

  /// No description provided for @addPassword.
  ///
  /// In en, this message translates to:
  /// **'Add Password'**
  String get addPassword;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **' (Optional)'**
  String get optional;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match. Please try again'**
  String get passwordMismatch;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @sessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please log in again'**
  String get sessionExpired;

  /// No description provided for @passwordSaved.
  ///
  /// In en, this message translates to:
  /// **'Password saved'**
  String get passwordSaved;

  /// No description provided for @favourites.
  ///
  /// In en, this message translates to:
  /// **'Favourites'**
  String get favourites;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get copied;

  /// No description provided for @noMatchingPasswordsFound.
  ///
  /// In en, this message translates to:
  /// **'No matching passwords found'**
  String get noMatchingPasswordsFound;

  /// No description provided for @passwordDeleted.
  ///
  /// In en, this message translates to:
  /// **'Password deleted'**
  String get passwordDeleted;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @actionCanNotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone'**
  String get actionCanNotBeUndone;

  /// No description provided for @confirmDeletePassword.
  ///
  /// In en, this message translates to:
  /// **'Delete Password?'**
  String get confirmDeletePassword;

  /// No description provided for @confirmDeleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Delete Category?'**
  String get confirmDeleteCategory;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @biometricLogin.
  ///
  /// In en, this message translates to:
  /// **'Biometric login'**
  String get biometricLogin;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'App version'**
  String get appVersion;

  /// No description provided for @categorySaved.
  ///
  /// In en, this message translates to:
  /// **'Category saved'**
  String get categorySaved;

  /// No description provided for @categoryDeleted.
  ///
  /// In en, this message translates to:
  /// **'Category deleted'**
  String get categoryDeleted;

  /// No description provided for @passwords.
  ///
  /// In en, this message translates to:
  /// **'Passwords'**
  String get passwords;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @createNew.
  ///
  /// In en, this message translates to:
  /// **'Create New'**
  String get createNew;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @categoryNameExists.
  ///
  /// In en, this message translates to:
  /// **'This category name exists'**
  String get categoryNameExists;

  /// No description provided for @categoryNameEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter a category name'**
  String get categoryNameEmpty;

  /// No description provided for @categoryName.
  ///
  /// In en, this message translates to:
  /// **'Category name'**
  String get categoryName;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// No description provided for @privacyPolicyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last updated: August 2026'**
  String get privacyPolicyLastUpdated;

  /// No description provided for @privacyPolicyIntro.
  ///
  /// In en, this message translates to:
  /// **'PassKeeper is designed to keep your data on your device, not on our servers. This policy explains what that means in practice.'**
  String get privacyPolicyIntro;

  /// No description provided for @privacyPolicyWhatWeCollectTitle.
  ///
  /// In en, this message translates to:
  /// **'What We Collect'**
  String get privacyPolicyWhatWeCollectTitle;

  /// No description provided for @privacyPolicyWhatWeCollectBody.
  ///
  /// In en, this message translates to:
  /// **'Nothing. PassKeeper does not collect, transmit, or store any of your data on external servers. We have no analytics, no tracking, and no account system.'**
  String get privacyPolicyWhatWeCollectBody;

  /// No description provided for @privacyPolicyDataLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Where Your Data Lives'**
  String get privacyPolicyDataLocationTitle;

  /// No description provided for @privacyPolicyDataLocationBody.
  ///
  /// In en, this message translates to:
  /// **'All passwords, categories, and settings are stored locally on your device. Your passwords are encrypted using AES-256-GCM before they touch storage, with a unique encryption key derived from your PIN.'**
  String get privacyPolicyDataLocationBody;

  /// No description provided for @privacyPolicyBiometricTitle.
  ///
  /// In en, this message translates to:
  /// **'Biometric Authentication'**
  String get privacyPolicyBiometricTitle;

  /// No description provided for @privacyPolicyBiometricBody.
  ///
  /// In en, this message translates to:
  /// **'If you enable fingerprint or face unlock, this is handled entirely by your device\'s operating system. PassKeeper never receives or stores your biometric data.'**
  String get privacyPolicyBiometricBody;

  /// No description provided for @privacyPolicyBackupsTitle.
  ///
  /// In en, this message translates to:
  /// **'Backups'**
  String get privacyPolicyBackupsTitle;

  /// No description provided for @privacyPolicyBackupsBody.
  ///
  /// In en, this message translates to:
  /// **'PassKeeper does not back up your data automatically. If your device backs up app data to a cloud service, that backup is subject to that service\'s own encryption and privacy terms, not ours.'**
  String get privacyPolicyBackupsBody;

  /// No description provided for @privacyPolicyDeletingDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Deleting Your Data'**
  String get privacyPolicyDeletingDataTitle;

  /// No description provided for @privacyPolicyDeletingDataBody.
  ///
  /// In en, this message translates to:
  /// **'Uninstalling PassKeeper permanently deletes all locally stored data. Since we never had a copy, there is nothing further to delete on our end.'**
  String get privacyPolicyDeletingDataBody;

  /// No description provided for @privacyPolicyChangesTitle.
  ///
  /// In en, this message translates to:
  /// **'Changes to This Policy'**
  String get privacyPolicyChangesTitle;

  /// No description provided for @privacyPolicyChangesBody.
  ///
  /// In en, this message translates to:
  /// **'If this policy changes, we will update the date above and, for any material change, notify you within the app.'**
  String get privacyPolicyChangesBody;

  /// No description provided for @privacyPolicyContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get privacyPolicyContactTitle;

  /// No description provided for @privacyPolicyContactBody.
  ///
  /// In en, this message translates to:
  /// **'Questions about this policy can be sent to bavleymourad@gmail.com.'**
  String get privacyPolicyContactBody;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
