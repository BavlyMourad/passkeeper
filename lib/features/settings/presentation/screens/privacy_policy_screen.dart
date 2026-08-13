import 'package:flutter/material.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/back_button.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GradientBackground(
      begin: context.isDarkTheme ? Alignment.bottomRight : Alignment.centerLeft,
      end: context.isDarkTheme ? Alignment.topLeft : Alignment.topRight,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          titleSpacing: 0.0,
          automaticallyImplyLeading: false,
          title: const AppBackButton(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.horizontalPadding(context.isMobile),
          ),
          child: ListView(
            children: [
              const SizedBox(height: 50.0),

              Text(
                l10n.privacyPolicy,
                style: AppStyles.headlineSemiBold(context),
              ),

              const SizedBox(height: 40.0),

              Text(
                l10n.privacyPolicyLastUpdated,
                style: AppStyles.bodySmallMedium(context),
              ),

              const SizedBox(height: 24.0),

              Text(
                l10n.privacyPolicyIntro,
                style: AppStyles.bodyRegular(context),
              ),

              const SizedBox(height: 24.0),

              Text(
                l10n.privacyPolicyWhatWeCollectTitle,
                style: AppStyles.titleMediumSemiBold(context),
              ),
              const SizedBox(height: 8.0),
              Text(
                l10n.privacyPolicyWhatWeCollectBody,
                style: AppStyles.bodyRegular(context),
              ),

              const SizedBox(height: 24.0),

              Text(
                l10n.privacyPolicyDataLocationTitle,
                style: AppStyles.titleMediumSemiBold(context),
              ),
              const SizedBox(height: 8.0),
              Text(
                l10n.privacyPolicyDataLocationBody,
                style: AppStyles.bodyRegular(context),
              ),

              const SizedBox(height: 24.0),

              Text(
                l10n.privacyPolicyBiometricTitle,
                style: AppStyles.titleMediumSemiBold(context),
              ),
              const SizedBox(height: 8.0),
              Text(
                l10n.privacyPolicyBiometricBody,
                style: AppStyles.bodyRegular(context),
              ),

              const SizedBox(height: 24.0),

              Text(
                l10n.privacyPolicyBackupsTitle,
                style: AppStyles.titleMediumSemiBold(context),
              ),
              const SizedBox(height: 8.0),
              Text(
                l10n.privacyPolicyBackupsBody,
                style: AppStyles.bodyRegular(context),
              ),

              const SizedBox(height: 24.0),

              Text(
                l10n.privacyPolicyDeletingDataTitle,
                style: AppStyles.titleMediumSemiBold(context),
              ),
              const SizedBox(height: 8.0),
              Text(
                l10n.privacyPolicyDeletingDataBody,
                style: AppStyles.bodyRegular(context),
              ),

              const SizedBox(height: 24.0),

              Text(
                l10n.privacyPolicyChangesTitle,
                style: AppStyles.titleMediumSemiBold(context),
              ),
              const SizedBox(height: 8.0),
              Text(
                l10n.privacyPolicyChangesBody,
                style: AppStyles.bodyRegular(context),
              ),

              const SizedBox(height: 24.0),

              Text(
                l10n.privacyPolicyContactTitle,
                style: AppStyles.titleMediumSemiBold(context),
              ),
              const SizedBox(height: 8.0),
              Text(
                l10n.privacyPolicyContactBody,
                style: AppStyles.bodyRegular(context),
              ),

              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
