import 'package:flutter/material.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';

class CategoryActionChip extends StatelessWidget {
  const CategoryActionChip({
    super.key,
    this.avatarIconPath,
    required this.label,
    required this.onPressed,
  });

  final String? avatarIconPath;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      avatar: avatarIconPath != null
          ? AppIcon(
              path: avatarIconPath!,
              size: IconSize.smallest,
              color: Theme.of(context).colorScheme.actionChipText,
            )
          : null,
      label: Text(label),
      labelPadding: const EdgeInsets.only(left: 8.0, right: 4.0),
      labelStyle: AppStyles.bodySmallMedium(
        context,
      ).copyWith(color: Theme.of(context).colorScheme.actionChipText),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(50.0),
      ),
      onPressed: onPressed,
    );
  }
}
