import 'package:flutter/material.dart';
import 'package:passkeeper/core/constants/app_strings.dart';
import 'package:passkeeper/core/constants/image_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_image.dart';

class AppLogoBar extends StatelessWidget implements PreferredSizeWidget {
  const AppLogoBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0.0,
      titleSpacing: 0.0,
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.horizontalPadding(context.isMobile),
        ),
        child: Row(
          spacing: 8.0,
          children: [
            AppImage(
              path: ImagePaths.logo,
              mobileSize: 32.0,
              tabletSize: 48.0,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              AppStrings.appName,
              style: AppStyles.titleLargeSemiBold(context),
            ),
          ],
        ),
      ),
    );
  }
}
