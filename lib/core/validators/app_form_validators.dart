import 'package:flutter/material.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';

class AppFormValidators {
  AppFormValidators._();

  static String? pin(BuildContext context, String? value) {
    if (value == null || value.length < 6) {
      return AppLocalizations.of(context)!.pinTooShort;
    }

    return null;
  }

  static String? confirmPin(BuildContext context, String? value, String pin) {
    if (value == null || value.length < 6) {
      return AppLocalizations.of(context)!.pinTooShort;
    }

    if (value != pin) {
      return AppLocalizations.of(context)!.pinMismatch;
    }

    return null;
  }
}
