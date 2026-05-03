import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/core/widgets/language_selection_button.dart';
import 'package:passkeeper/core/widgets/theme_toggle_button.dart';
import 'package:passkeeper/core/widgets/welcome_header.dart';
import 'package:passkeeper/features/auth/widgets/create_pin_sheet.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actionsPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        actions: const [LanguageSelectionButton(), ThemeToggleButton()],
      ),
      body: GradientBackground(
        begin: context.isDarkTheme
            ? Alignment.bottomRight
            : Alignment.centerRight,
        end: Alignment.topLeft,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.horizontalPadding(context.isMobile),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const WelcomeHeader(),
                SizedBox(height: SizeConfig.sectionSpacing(context.isMobile)),
                Text(
                  AppLocalizations.of(context)!.loginSubtitle,
                  style: AppStyles.titleLargeSemiBold(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Text(
                  AppLocalizations.of(context)!.loginDescription,
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
                    onPressed: () => AppUtils.showBottomModalSheet(
                      context: context,
                      child: const CreatePinSheet(),
                    ),
                    title: AppLocalizations.of(context)!.loginSetPinButtonLabel,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: SizeConfig.tabletConstrainedWidth(
                    context.screenWidth,
                    context.isMobile,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.loginBiometricInfoText,
                    style: AppStyles.captionRegular(context),
                    textAlign: TextAlign.center,
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
