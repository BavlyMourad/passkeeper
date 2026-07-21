import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/features/passwords/application/password_service.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';

class PasswordFormHeader extends ConsumerWidget {
  const PasswordFormHeader({super.key, this.password});

  final Password? password;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          onPressed: () {
            if (password != null) {
              ref.read(passwordServiceProvider).toggleFavourite(password!.id);
            }
          },
          icon: AppIcon(
            path: password?.isFavourite ?? false
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
