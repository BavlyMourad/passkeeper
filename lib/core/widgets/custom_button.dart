import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.title,
    required this.onPressed,
    this.prefixIconPath,
    this.iconButtonPath,
  }) : assert(
         (title != null) != (iconButtonPath != null),
         'Provide either title or iconButtonPath, not both or neither',
       );

  final String? title;
  final VoidCallback? onPressed;
  final String? prefixIconPath;
  final String? iconButtonPath;

  @override
  Widget build(BuildContext context) {
    final isIconButton = iconButtonPath != null;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: Theme.of(context).colorScheme.buttonGradient,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: SizeConfig.buttonHeight(context.isMobile),
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
        child: isIconButton
            ? AppIcon(path: iconButtonPath!, size: IconSize.medium)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIconPath != null) ...[
                    SvgPicture.asset(
                      prefixIconPath!,
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
                    title!,
                    style: AppStyles.titleSmallSemiBold(context).copyWith(
                      color: Theme.of(context).colorScheme.buttonTextColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
