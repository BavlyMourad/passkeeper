import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/dummy_data.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/back_button.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
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

  @override
  Widget build(BuildContext context) {
    // TODO: CHANGE LATER
    final password = dummyPasswords.firstWhere(
      (password) => password.id == widget.id,
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

                    PasswordFormHeader(password: password),

                    const SizedBox(height: 50.0),

                    PasswordForm(
                      password: password,
                      onSubmit: (password) {
                        _toggleEditMode();
                      },
                      isReadOnly: !_isEditingMode,
                    ),

                    if (!_isEditingMode) ...[
                      const SizedBox(height: 32.0),
                      Row(
                        spacing: 16.0,
                        children: [
                          Expanded(
                            child: EditButton(onPressed: _toggleEditMode),
                          ),
                          Expanded(
                            child: CustomButton(
                              onPressed: () {},
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
        ),
      ),
    );
  }
}
