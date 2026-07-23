import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/features/passwords/application/password_service.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';

class PasswordCard extends ConsumerWidget {
  const PasswordCard({
    super.key,
    required this.password,
    this.source = PasswordDetailsSource.passwords,
  });

  final Password password;
  final PasswordDetailsSource source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        switch (source) {
          case PasswordDetailsSource.passwords:
            context.push(AppRoutes.passwordDetailsPath(password.id));

          case PasswordDetailsSource.favourites:
            context.push(AppRoutes.favouritePasswordDetailsPath(password.id));
        }
      },
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Center(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 0.0,
            ),
            leading: AppIcon(
              path: password.logo ?? IconPaths.password,
              size: IconSize.medium,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            title: Text(
              password.title,
              style: AppStyles.titleSmallSemiBold(context),
            ),
            subtitle: password.username != null
                ? Text(
                    password.username!,
                    style: AppStyles.captionRegular(context).copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  )
                : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    ref
                        .read(passwordServiceProvider)
                        .toggleFavourite(password.id);
                  },
                  icon: AppIcon(
                    path: password.isFavourite
                        ? IconPaths.favourite
                        : IconPaths.favouriteOutline,
                    size: IconSize.small,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: AppIcon(
                    path: IconPaths.copy,
                    size: IconSize.medium,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
