import 'package:flutter/material.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';

class CreatePinSheet extends StatelessWidget {
  const CreatePinSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: SizeConfig.tabletConstrainedWidth(
          context.screenWidth,
          context.isMobile,
        ),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.createPinTitle,
              style: AppStyles.titleLargeSemiBold(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            TextField(
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: SizeConfig.textFieldHeight(context.isMobile),
                ),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.visibility_off),
                prefixIconColor: Theme.of(context).colorScheme.onSecondary,
                suffixIconColor: Theme.of(
                  context,
                ).colorScheme.onSecondary.withValues(alpha: 0.5),
                filled: true,
                fillColor: Theme.of(context).colorScheme.textFieldBackground,
                hintText: AppLocalizations.of(context)!.enterPinHint,
                hintStyle: AppStyles.bodySmallMedium(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                constraints: BoxConstraints(
                  maxHeight: SizeConfig.textFieldHeight(context.isMobile),
                ),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.visibility_off),
                prefixIconColor: Theme.of(context).colorScheme.onSecondary,
                suffixIconColor: Theme.of(
                  context,
                ).colorScheme.onSecondary.withValues(alpha: 0.5),
                filled: true,
                fillColor: Theme.of(context).colorScheme.textFieldBackground,
                hintText: AppLocalizations.of(context)!.confirmPinHint,
                hintStyle: AppStyles.bodySmallMedium(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.enableBiometric,
                  style: AppStyles.bodyRegular(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                Switch(value: false, onChanged: (value) {}),
              ],
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              onPressed: () {},
              title: AppLocalizations.of(context)!.confirmButton,
            ),
            const SizedBox(height: 35.0),
          ],
        ),
      ),
    );
  }
}
