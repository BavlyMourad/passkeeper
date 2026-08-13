import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/features/categories/presentation/providers/categories_provider.dart';

class CategoryFilterChips extends ConsumerWidget {
  const CategoryFilterChips({
    super.key,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  final String? selectedCategoryId;
  final ValueChanged<String?> onCategorySelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final categories = ref.watch(categoriesProvider);

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.only(
          start: SizeConfig.horizontalPadding(context.isMobile),
        ),
        itemCount: categories.length + 1, // +1 for "All" chip
        separatorBuilder: (_, __) => const SizedBox(width: 12.0),
        itemBuilder: (context, index) {
          final isAll = index == 0;

          final category = isAll ? null : categories[index - 1];

          final isSelected = isAll
              ? selectedCategoryId == null
              : selectedCategoryId == category!.id;

          return FilterChip(
            label: Text(
              isAll ? AppLocalizations.of(context)!.all : category!.name,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            selected: isSelected,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(50.0),
            ),
            onSelected: (_) => onCategorySelected(isAll ? null : category!.id),
            selectedColor: colorScheme.filterChipSelectedBackground,
            backgroundColor: colorScheme.filterChipUnselectedBackground,
            labelStyle: isSelected
                ? AppStyles.bodySmallSemiBold(
                    context,
                  ).copyWith(color: colorScheme.filterChipSelectedText)
                : AppStyles.bodySmallMedium(
                    context,
                  ).copyWith(color: colorScheme.filterChipUnselectedText),
            showCheckmark: false,
          );
        },
      ),
    );
  }
}
