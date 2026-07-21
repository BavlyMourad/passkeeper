import 'package:flutter/material.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/password_card.dart';

class PasswordsList extends StatelessWidget {
  const PasswordsList({
    super.key,
    required this.passwords,
    this.source = PasswordDetailsSource.passwords,
  });

  final List<Password> passwords;
  final PasswordDetailsSource source;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.horizontalPadding(context.isMobile),
      ),
      child: GridView.builder(
        itemCount: passwords.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.isMobile ? 1 : 2,
          mainAxisExtent: 72,
          mainAxisSpacing: 24.0,
          crossAxisSpacing: 24.0,
        ),
        itemBuilder: (context, index) {
          return PasswordCard(password: passwords[index], source: source);
        },
      ),
    );
  }
}
