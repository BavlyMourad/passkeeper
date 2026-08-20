import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: GradientBackground(
        begin: context.isDarkTheme
            ? Alignment.bottomRight
            : Alignment.centerLeft,
        end: context.isDarkTheme ? Alignment.topLeft : Alignment.topRight,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.horizontalPadding(context.isMobile),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppIcon(
                  path: IconPaths.searchOff,
                  size: IconSize.largest,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 24.0),
                Text(
                  l10n.pageNotFoundTitle,
                  style: AppStyles.titleLargeSemiBold(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                Text(
                  l10n.pageNotFoundDescription,
                  style: AppStyles.bodyRegular(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.sectionSpacing(context.isMobile)),
                SizedBox(
                  width: SizeConfig.tabletConstrainedWidth(
                    context.screenWidth,
                    context.isMobile,
                  ),
                  child: CustomButton(
                    title: l10n.goHomeButtonLabel,
                    onPressed: () => context.go(AppRoutes.passwords),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
