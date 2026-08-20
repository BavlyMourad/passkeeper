import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/core/widgets/welcome_header.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GradientBackground(
        begin: context.isDarkTheme ? Alignment.topCenter : Alignment.center,
        end: Alignment.bottomCenter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const WelcomeHeader(),
              SizedBox(height: SizeConfig.sectionSpacing(context.isMobile)),
              SpinKitThreeBounce(
                color: Theme.of(context).colorScheme.primary,
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
