import 'package:flutter/material.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';

class AppUtils {
  AppUtils._();

  static void showSnackBar({
    required BuildContext context,
    required String message,
    Color? color,
    int duration = 2,
  }) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppStyles.bodySmallMedium(
          context,
        ).copyWith(color: Theme.of(context).colorScheme.onError),
      ),
      backgroundColor: color ?? Theme.of(context).colorScheme.error,
      duration: Duration(seconds: duration),
    );

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(snackBar);
  }

  static void showBottomModalSheet({
    required BuildContext context,
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.bottomSheetBackground,
      constraints: const BoxConstraints(maxWidth: double.infinity),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsetsGeometry.only(
              bottom: MediaQuery.viewInsetsOf(context).bottom,
              left: 24.0,
              right: 24.0,
              top: 24.0,
            ),
            child: child,
          ),
        );
      },
    );
  }

  static Future<T?> showAppDialog<T>({
    required BuildContext context,
    required Widget child,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 24.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Padding(padding: const EdgeInsets.all(24.0), child: child),
        );
      },
    );
  }
}
