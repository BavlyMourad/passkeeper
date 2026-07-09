import 'package:flutter/material.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/widgets/back_button.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/password_form_header.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/password_form.dart';

class AddPasswordScreen extends StatelessWidget {
  const AddPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

                    PasswordForm(onSubmit: (password) {}),

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
