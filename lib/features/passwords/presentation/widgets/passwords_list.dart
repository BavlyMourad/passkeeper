import 'package:flutter/material.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/password_card.dart';

class PasswordsList extends StatelessWidget {
  const PasswordsList({
    super.key,
    required this.passwords,
    required this.onPasswordTap,
    required this.trailingBuilder,
    this.bottomPadding = 24.0,
  });

  final List<Password> passwords;
  final void Function(BuildContext context, Password password) onPasswordTap;
  final Widget Function(BuildContext context, Password password)
  trailingBuilder;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: passwords.length,
      padding: EdgeInsets.only(bottom: bottomPadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isMobile ? 1 : 2,
        mainAxisExtent: 72,
        mainAxisSpacing: 24.0,
        crossAxisSpacing: 24.0,
      ),
      itemBuilder: (context, index) {
        final password = passwords[index];

        return PasswordCard(
          password: passwords[index],
          onTap: () => onPasswordTap(context, password),
          trailing: trailingBuilder(context, password),
        );
      },
    );
  }
}
