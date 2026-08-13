import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/providers/is_first_time_user.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/core/widgets/language_toggle_button.dart';
import 'package:passkeeper/core/widgets/theme_toggle_button.dart';
import 'package:passkeeper/core/widgets/welcome_header.dart';
import 'package:passkeeper/features/auth/presentation/widgets/create_pin_sheet.dart';
import 'package:passkeeper/features/auth/presentation/widgets/login_form.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void _showCreatePinSheet(BuildContext context) {
    return AppUtils.showBottomModalSheet(
      context: context,
      child: const CreatePinSheet(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFirstTimeUser = ref.watch(isFirstTimeUserProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actionsPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        actions: const [LanguageToggleButton(), ThemeToggleButton()],
      ),
      body: GradientBackground(
        begin: context.isDarkTheme
            ? Alignment.bottomRight
            : Alignment.centerRight,
        end: Alignment.topLeft,
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.horizontalPadding(context.isMobile),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Welcome header
                    const WelcomeHeader(),

                    SizedBox(
                      height: SizeConfig.sectionSpacing(context.isMobile),
                    ),

                    // Login subtitle
                    Text(
                      AppLocalizations.of(context)!.loginSubtitle,
                      style: AppStyles.titleLargeSemiBold(context),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 16.0),

                    // Login description
                    Text(
                      AppLocalizations.of(context)!.loginDescription,
                      style: AppStyles.bodyRegular(context),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(
                      height: SizeConfig.sectionSpacing(context.isMobile),
                    ),

                    // Set a pin button
                    if (isFirstTimeUser)
                      SizedBox(
                        width: SizeConfig.tabletConstrainedWidth(
                          context.screenWidth,
                          context.isMobile,
                        ),
                        child: CustomButton(
                          onPressed: () => _showCreatePinSheet(context),
                          title: AppLocalizations.of(
                            context,
                          )!.loginSetPinButtonLabel,
                        ),
                      ),

                    // Login form
                    if (!isFirstTimeUser) ...[const LoginForm()],

                    const SizedBox(height: 16.0),

                    // Login biometric info
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

                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
