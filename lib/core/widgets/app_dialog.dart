import 'package:flutter/material.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppStyles.titleMediumSemiBold(context)),
        const SizedBox(height: 12.0),
        Text(
          subtitle,
          style: AppStyles.bodyRegular(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24.0),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.cancelButton,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8.0),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.cancel,
                  style: AppStyles.titleSmallSemiBold(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.cancelButton),
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                  onTap();
                },
                title: AppLocalizations.of(context)!.delete,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
