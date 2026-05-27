import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/providers/biometric_auth.dart';
import 'package:passkeeper/core/providers/obscure_text.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/validators/app_form_validators.dart';
import 'package:passkeeper/core/widgets/app_text_field.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/core/widgets/loader.dart';
import 'package:passkeeper/features/auth/presentation/controllers/create_pin_controller.dart';

class CreatePinSheet extends ConsumerStatefulWidget {
  const CreatePinSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreatePinSheetState();
}

class _CreatePinSheetState extends ConsumerState<CreatePinSheet> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _biometricError = '';

  @override
  void dispose() {
    _pinController.dispose();
    _confirmPinController.dispose();

    super.dispose();
  }

  void _toggleObscureText(String key) {
    ref.read(obscureTextProvider(key).notifier).toggle();
  }

  Future<void> _toggleBiometric(BuildContext context) async {
    setState(() => _biometricError = ''); // clear on every toggle attempt

    final success = await ref.read(biometricAuthProvider.notifier).toggle();

    if (!success) {
      setState(() {
        _biometricError = AppLocalizations.of(context)!.biometricNotAvailable;
      });
    }
  }

  Future<void> _confirmPin() async {
    if (_formKey.currentState!.validate()) {
      // Close keyboard
      FocusScope.of(context).unfocus();

      await ref
          .read(createPinControllerProvider.notifier)
          .setupPin(_pinController.text, _confirmPinController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Handle navigation
    ref.listen(createPinControllerProvider, (_, state) {
      if (state is AsyncData) {
        context.go(AppRoutes.passwords);
      }
    });

    final isPinObscured = ref.watch(obscureTextProvider(ObscureTextKeys.pin));
    final isConfirmPinObscured = ref.watch(
      obscureTextProvider(ObscureTextKeys.confirmPin),
    );
    final isLoading = ref.watch(createPinControllerProvider).isLoading;
    final biometricEnabled = ref.watch(biometricAuthProvider);

    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: SizeConfig.tabletConstrainedWidth(
          context.screenWidth,
          context.isMobile,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Create pin title
              Text(
                AppLocalizations.of(context)!.createPinTitle,
                style: AppStyles.titleLargeSemiBold(context),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24.0),

              // Pin Text Field
              AppTextField(
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

              const SizedBox(height: 16.0),

              // Confirm Pin Text Field
              AppTextField(
                controller: _confirmPinController,
                obscureText: isConfirmPinObscured,
                keyboardType: TextInputType.number,
                maxLength: 6,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) => AppFormValidators.confirmPin(
                  context,
                  value,
                  _pinController.text,
                ),
                prefixIconPath: IconPaths.password,
                suffixIconPath: isConfirmPinObscured
                    ? IconPaths.invisible
                    : IconPaths.visible,
                onSuffixIconPressed: () =>
                    _toggleObscureText(ObscureTextKeys.confirmPin),
                hintText: AppLocalizations.of(context)!.confirmPinHint,
              ),
              const SizedBox(height: 16.0),

              // Biometric
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.enableBiometric,
                    style: AppStyles.bodyRegular(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  Switch(
                    value: biometricEnabled,
                    onChanged: (_) => _toggleBiometric(context),
                  ),
                ],
              ),

              if (_biometricError.isNotEmpty)
                Text(
                  _biometricError,
                  style: AppStyles.bodySmallMedium(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.error),
                ),

              const SizedBox(height: 16.0),

              // Button
              isLoading
                  ? const Loader()
                  : CustomButton(
                      onPressed: _confirmPin,
                      title: AppLocalizations.of(context)!.confirmButton,
                    ),
              const SizedBox(height: 35.0),
            ],
          ),
        ),
      ),
    );
  }
}
