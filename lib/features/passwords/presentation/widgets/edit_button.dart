import 'package:flutter/material.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      label: Text(
        AppLocalizations.of(context)!.edit,
        style: AppStyles.titleSmallSemiBold(
          context,
        ).copyWith(color: Theme.of(context).colorScheme.editButton),
      ),
      icon: AppIcon(
        path: IconPaths.edit,
        size: IconSize.small,
        color: Theme.of(context).colorScheme.editButton,
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Theme.of(context).colorScheme.editButton),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8.0),
        ),
      ),
    );
  }
}
