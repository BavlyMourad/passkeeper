import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';

// TODO: Remove hardcoded data when controller is ready
class PasswordCard extends StatelessWidget {
  const PasswordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRoutes.passwordDetailsPath('1')),
      child: Card(
        margin: const EdgeInsets.all(0),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 0.0,
          ),
          leading: AppIcon(
            path: IconPaths.password,
            size: IconSize.medium,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          title: Text('Facebook', style: AppStyles.titleSmallSemiBold(context)),
          subtitle: Text(
            'example@gmail.com',
            style: AppStyles.captionRegular(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.onSecondary),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: AppIcon(
                  path: IconPaths.favourite,
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
    );
  }
}
