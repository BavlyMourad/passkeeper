import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: SizeConfig.horizontalPadding(context.isMobile),
          top: 14.0,
          bottom: 14.0,
          end: 14.0,
        ),
        child: Row(
          spacing: 8.0,
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.flip(
              flipX: Directionality.of(context) == TextDirection.rtl,
              child: AppIcon(
                path: IconPaths.back,
                size: IconSize.small,
                color: Theme.of(context).colorScheme.backButton,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.back,
              style: AppStyles.titleSmallSemiBold(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.backButton),
            ),
          ],
        ),
      ),
    );
  }
}
