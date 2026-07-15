import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/errors/app_exception.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/widgets/back_button.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/features/passwords/presentation/controllers/add_password_controller.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/password_form_header.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/password_form.dart';

class AddPasswordScreen extends ConsumerWidget {
  const AddPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(addPasswordControllerProvider, (previous, next) {
      // guard against the controller's default AsyncData(null) build state
      // only proceed if we just transitioned out of loading
      if (previous?.isLoading != true) return;

      next.whenOrNull(
        data: (_) {
          context.pop();

          AppUtils.showSnackBar(
            context: context,
            message: AppLocalizations.of(context)!.passwordSaved,
            color: Theme.of(context).colorScheme.snackBar,
          );
        },
        error: (error, _) {
          final message = switch (error) {
            SessionExpiredException() => AppLocalizations.of(
              context,
            )!.sessionExpired,
            _ => AppLocalizations.of(context)!.genericError,
          };

          AppUtils.showSnackBar(context: context, message: message);
        },
      );
    });

    final isLoading = ref.watch(addPasswordControllerProvider).isLoading;

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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.horizontalPadding(context.isMobile),
            ),
            child: Center(
              child: SizedBox(
                width: SizeConfig.tabletConstrainedWidth(
                  context.screenWidth,
                  context.isMobile,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50.0),

                    const PasswordFormHeader(),

                    const SizedBox(height: 50.0),

                    PasswordForm(
                      isLoading: isLoading,
                      onSubmit: (password) {
                        ref
                            .read(addPasswordControllerProvider.notifier)
                            .submit(password);
                      },
                    ),

                    const SizedBox(height: 32.0),
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
