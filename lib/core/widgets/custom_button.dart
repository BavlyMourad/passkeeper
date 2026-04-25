import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:passkeeper/config/theme/app_colors.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.iconPath,
    required this.title,
  });

  final VoidCallback onPressed;
  final String? iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: context.isDarkTheme
                ? AppColors.darkButtonGradientColors
                : AppColors.lightButtonGradientColors,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconPath != null) ...[
                SvgPicture.asset(
                  iconPath!,
                  width: 24.0,
                  height: 24.0,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onPrimary,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 12.0),
              ],
              Text(
                title,
                style: AppStyles.titleSmallSemiBold(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
