import 'package:flutter/material.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/theme/app_colors.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/core/widgets/app_text_field.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.horizontalPadding(context.isMobile),
      ),
      child: Row(
        spacing: 16.0,
        children: [
          Expanded(
            child: AppTextField(
              prefixIconPath: IconPaths.search,
              labelText: AppLocalizations.of(context)!.search,
            ),
          ),
          // TODO: Replace with a filter button
          const AppIcon(
            path: IconPaths.sort,
            size: IconSize.medium,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
