import 'package:flutter/material.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/widgets/app_image.dart';
import 'package:passkeeper/core/constants/app_strings.dart';
import 'package:passkeeper/core/constants/image_paths.dart';
import 'package:passkeeper/core/styles/app_styles.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.welcomeTo,
          style: AppStyles.titleLargeRegular(context),
        ),
        const SizedBox(height: 14.0),
        Text(AppStrings.appName, style: AppStyles.displaySemiBold(context)),
        const SizedBox(height: 40.0),
        AppImage(
          path: ImagePaths.logo,
          mobileSize: 148.0,
          tabletSize: 200.0,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}
