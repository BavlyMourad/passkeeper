import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
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
        SvgPicture.asset(
          ImagePaths.logo,
          width: 148.0,
          height: 148.0,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(height: 40.0),
      ],
    );
  }
}
