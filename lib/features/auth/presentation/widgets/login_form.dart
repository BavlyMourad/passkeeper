import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/errors/app_exception.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/providers/biometric_auth.dart';
import 'package:passkeeper/core/providers/obscure_text.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/validators/app_form_validators.dart';
import 'package:passkeeper/core/widgets/app_text_field.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/core/widgets/loader.dart';
import 'package:passkeeper/features/auth/presentation/controllers/login_controller.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final TextEditingController _pinController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pinController.dispose();

    super.dispose();
  }

  void _toggleObscureText(String key) {
    ref.read(obscureTextProvider(key).notifier).toggle();
  }

  void _loginWithPin() {
    if (_formKey.currentState!.validate()) {
      // Close keyboard
      FocusScope.of(context).unfocus();

      ref
          .read(loginControllerProvider.notifier)
          .loginWithPin(_pinController.text);
    }
  }

  void _loginWithBiometric() {
    ref.read(loginControllerProvider.notifier).loginWithBiometric();
  }

  @override
  Widget build(BuildContext context) {
    // Handle Errors & Navigation
    ref.listen(loginControllerProvider, (_, state) {
      if (state is AsyncError) {
        final message = switch (state.error) {
          WrongPinException() => AppLocalizations.of(context)!.wrongPin,
          BiometricAuthException() => AppLocalizations.of(
            context,
          )!.biometricFailed,
          BiometricNotEnrolledException() => AppLocalizations.of(
            context,
          )!.biometricNotEnrolled,
          _ => AppLocalizations.of(context)!.genericError,
        };

        AppUtils.showSnackBar(context: context, message: message);
        return;
      }

      if (state is AsyncData) {
        context.go(AppRoutes.passwords);
      }
    });

    final isPinObscured = ref.watch(obscureTextProvider(ObscureTextKeys.pin));
    final isBiometricEnabled = ref.watch(biometricAuthProvider);

    final isLoading = ref.watch(loginControllerProvider).isLoading;

    return Column(
      children: [
        // Pin field
        SizedBox(
          width: SizeConfig.tabletConstrainedWidth(
            context.screenWidth,
            context.isMobile,
          ),
          child: Form(
            key: _formKey,
            child: AppTextField(
              controller: _pinController,
              obscureText: isPinObscured,
              keyboardType: TextInputType.number,
              maxLength: 6,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) => AppFormValidators.pin(context, value),
              prefixIconPath: IconPaths.password,
              suffixIconPath: isPinObscured
                  ? IconPaths.invisible
                  : IconPaths.visible,
              onSuffixIconPressed: () =>
                  _toggleObscureText(ObscureTextKeys.pin),
              hintText: AppLocalizations.of(context)!.enterPinHint,
            ),
          ),
        ),

        const SizedBox(height: 16.0),

        // Login & Biometric buttons
        isLoading
            ? const Loader()
            : SizedBox(
                width: SizeConfig.tabletConstrainedWidth(
                  context.screenWidth,
                  context.isMobile,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        title: AppLocalizations.of(context)!.login,
                        onPressed: _loginWithPin,
                      ),
                    ),
                    if (isBiometricEnabled) ...[
                      const SizedBox(width: 16.0),
                      CustomButton(
                        iconButtonPath: IconPaths.fingerprint,
                        onPressed: _loginWithBiometric,
                      ),
                    ],
                  ],
                ),
              ),
      ],
    );
  }
}
