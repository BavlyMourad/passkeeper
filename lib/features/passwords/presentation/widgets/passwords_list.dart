import 'package:flutter/material.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/password_card.dart';

class PasswordsList extends StatelessWidget {
  const PasswordsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.horizontalPadding(context.isMobile),
      ),
      child: GridView.builder(
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.isMobile ? 1 : 2,
          mainAxisExtent: 72,
          mainAxisSpacing: 24.0,
          crossAxisSpacing: 24.0,
        ),
        itemBuilder: (context, index) {
          return const PasswordCard();
        },
      ),
    );
  }
}
