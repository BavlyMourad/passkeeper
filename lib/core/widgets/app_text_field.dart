import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.keyboardType,
    required this.prefixIconPath,
    required this.hintText,
    this.suffixIconPath,
    this.secondarySuffixIconPath,
    this.onSuffixIconPressed,
    this.onSecondarySuffixIconPressed,
    this.maxLength,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String prefixIconPath;
  final String? suffixIconPath;
  final String? secondarySuffixIconPath;
  final VoidCallback? onSuffixIconPressed;
  final VoidCallback? onSecondarySuffixIconPressed;
  final String hintText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        counterText: '', // Hides the default "0/6" counter shown by maxLength
        constraints: BoxConstraints(
          maxHeight: SizeConfig.textFieldHeight(context.isMobile),
        ),
        prefixIcon: Center(
          widthFactor: 1.0,
          child: AppIcon(
            path: prefixIconPath,
            size: IconSize.small,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        suffixIcon: (suffixIconPath != null || secondarySuffixIconPath != null)
            // UnconstrainedBox lets the Row shrink to fit its icons and remove those constraints.
            ? UnconstrainedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (suffixIconPath != null)
                      InkWell(
                        onTap: onSuffixIconPressed,
                        child: AppIcon(
                          path: suffixIconPath!,
                          size: IconSize.small,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSecondary.withValues(alpha: 0.5),
                        ),
                      ),
                    if (secondarySuffixIconPath != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: InkWell(
                          onTap: onSecondarySuffixIconPressed,
                          child: AppIcon(
                            path: secondarySuffixIconPath!,
                            size: IconSize.small,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            : null,
        hintText: hintText,
        hintStyle: AppStyles.bodySmallMedium(
          context,
        ).copyWith(color: Theme.of(context).colorScheme.onSecondary),
      ),
    );
  }
}
