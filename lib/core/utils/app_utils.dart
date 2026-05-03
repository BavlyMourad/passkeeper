import 'package:flutter/material.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';

class AppUtils {
  AppUtils._();

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
}
