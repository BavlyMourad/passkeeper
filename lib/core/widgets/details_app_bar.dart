import 'package:flutter/material.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/back_button.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppBar({super.key, required this.isEditingMode});

  final bool isEditingMode;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            isEditingMode
                ? AppLocalizations.of(context)!.edit
                : AppLocalizations.of(context)!.view,
            style: AppStyles.titleSmallSemiBold(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.appBarAction),
          ),
        ),
      ],
    );
  }
}
