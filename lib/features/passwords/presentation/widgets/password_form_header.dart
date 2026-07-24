import 'package:flutter/material.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';

class PasswordFormHeader extends StatelessWidget {
  const PasswordFormHeader({
    super.key,
    this.password,
    required this.isFavourite,
    required this.onToggleFavourite,
  });

  final Password? password;
  final bool isFavourite;
  final VoidCallback onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 28.0,
      children: [
        Expanded(
          child: Row(
            spacing: 8.0,
            children: [
              if (password != null)
                AppIcon(
                  path: password!.logo ?? IconPaths.password,
                  size: IconSize.large,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              Expanded(
                child: Text(
                  password == null
                      ? AppLocalizations.of(context)!.addPassword
                      : password!.title,
                  style: AppStyles.headlineSemiBold(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onToggleFavourite,
          icon: AppIcon(
            path: isFavourite
                ? IconPaths.favourite
                : IconPaths.favouriteOutline,
            size: IconSize.medium,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}
