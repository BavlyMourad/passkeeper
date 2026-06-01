import 'package:flutter/material.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';

class NoPasswordsYet extends StatelessWidget {
  const NoPasswordsYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.horizontalPadding(context.isMobile),
      ),
      child: Text(
        AppLocalizations.of(context)!.noPasswordsYet,
        textAlign: TextAlign.center,
        style: AppStyles.titleLargeRegular(context),
      ),
    );
  }
}
