import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/password_icon.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';

class PasswordCard extends ConsumerWidget {
  const PasswordCard({
    super.key,
    required this.password,
    required this.onTap,
    required this.trailing,
  });

  final Password password;
  final VoidCallback onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Center(
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 0.0,
            ),
            leading: PasswordIcon(
              logoPath: password.logo,
              size: context.isMobile ? IconSize.large : IconSize.medium,
            ),
            title: Text(
              password.title,
              overflow: TextOverflow.ellipsis,
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
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
