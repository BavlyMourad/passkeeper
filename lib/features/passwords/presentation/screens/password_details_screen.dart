import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/widgets/back_button.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/core/widgets/loader.dart';
import 'package:passkeeper/features/passwords/application/password_service.dart';
import 'package:passkeeper/features/passwords/presentation/controllers/password_details_controller.dart';
import 'package:passkeeper/core/widgets/app_dialog.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/edit_button.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/password_form.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/password_form_header.dart';

class PasswordDetailsScreen extends ConsumerStatefulWidget {
  const PasswordDetailsScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordDetailsScreenState();
}

class _PasswordDetailsScreenState extends ConsumerState<PasswordDetailsScreen> {
  bool _isEditingMode = false;

  void _toggleEditMode() => setState(() {
    _isEditingMode = !_isEditingMode;
  });

  void _toggleFavourite(String passwordId) {
    ref.read(passwordServiceProvider).toggleFavourite(passwordId);
  }

  void _deletePassword() {
    ref
        .read(passwordDetailsControllerProvider(widget.id).notifier)
        .deletePassword();

    AppUtils.showSnackBar(
      context: context,
      message: AppLocalizations.of(context)!.passwordDeleted,
      color: Theme.of(context).colorScheme.snackBar,
    );

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final passwordState = ref.watch(
      passwordDetailsControllerProvider(widget.id),
    );

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
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                end: SizeConfig.horizontalPadding(context.isMobile),
              ),
              child: Text(
                _isEditingMode
                    ? AppLocalizations.of(context)!.edit
                    : AppLocalizations.of(context)!.view,
                style: AppStyles.titleSmallSemiBold(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.appBarAction),
              ),
            ),
          ],
        ),
        body: passwordState.when(
          loading: () => const Loader(),
          error: (error, _) =>
              Center(child: Text(AppLocalizations.of(context)!.genericError)),
          data: (password) {
            return SingleChildScrollView(
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

                        PasswordFormHeader(
                          password: password,
                          isFavourite: password.isFavourite,
                          onToggleFavourite: () =>
                              _toggleFavourite(password.id),
                        ),

                        const SizedBox(height: 50.0),

                        PasswordForm(
                          password: password,
                          isLoading: passwordState.isLoading,
                          onSubmit: (editedPassword) {
                            _toggleEditMode();

                            ref
                                .read(
                                  passwordDetailsControllerProvider(
                                    widget.id,
                                  ).notifier,
                                )
                                .updatePassword(editedPassword);
                          },
                          isReadOnly: !_isEditingMode,
                        ),

                        const SizedBox(height: 32.0),

                        if (!_isEditingMode) ...[
                          Row(
                            spacing: 16.0,
                            children: [
                              Expanded(
                                child: EditButton(onPressed: _toggleEditMode),
                              ),
                              Expanded(
                                child: CustomButton(
                                  onPressed: () {
                                    AppUtils.showAppDialog(
                                      context: context,
                                      child: SizedBox(
                                        width:
                                            SizeConfig.tabletConstrainedWidth(
                                              context.screenWidth,
                                              context.isMobile,
                                            ),
                                        child: AppDialog(
                                          title: AppLocalizations.of(
                                            context,
                                          )!.confirmDeletePassword,
                                          subtitle: AppLocalizations.of(
                                            context,
                                          )!.actionCanNotBeUndone,
                                          onTap: _deletePassword,
                                        ),
                                      ),
                                    );
                                  },
                                  title: AppLocalizations.of(context)!.delete,
                                  prefixIconPath: IconPaths.delete,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
