import 'package:flutter/material.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';

class AppFormValidators {
  AppFormValidators._();

  // Generic required validation
  static String? required(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.fieldRequired;
    }
    return null;
  }

  // Pin
  static String? pin(BuildContext context, String? value) {
    if (value == null || value.length < 6) {
      return AppLocalizations.of(context)!.pinTooShort;
    }

    return null;
  }

  // Confirm Pin
  static String? confirmPin(BuildContext context, String? value, String pin) {
    if (value == null || value.length < 6) {
      return AppLocalizations.of(context)!.pinTooShort;
    }

    if (value != pin) {
      return AppLocalizations.of(context)!.pinMismatch;
    }

    return null;
  }

  // Confirm Password
  static String? confirmPassword(
    BuildContext context,
    String? value,
    String password,
  ) {
    if (value != password) {
      return AppLocalizations.of(context)!.passwordMismatch;
    }

    return null;
  }
}
