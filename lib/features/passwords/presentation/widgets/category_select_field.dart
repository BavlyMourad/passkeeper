import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/features/categories/presentation/providers/categories_provider.dart';

class CategorySelectField extends ConsumerWidget {
  const CategorySelectField({
    super.key,
    required this.selectedCategoryIds,
    required this.onCategorySelected,
    required this.onCategoryRemoved,
    required this.onAddNewCategory,
  });

  final List<String> selectedCategoryIds;
  final void Function(String categoryId) onCategorySelected;
  final void Function(String categoryId) onCategoryRemoved;
  final VoidCallback onAddNewCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);

    return Column(
      children: [
        PopupMenuButton<String>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onOpened: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: InputDecorator(
            decoration: InputDecoration(
              isDense: context.isMobile,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 5.0),
                child: AppIcon(
                  path: IconPaths.categories2,
                  size: IconSize.medium,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              prefixIconConstraints: const BoxConstraints(minWidth: 0.0),
              suffixIconConstraints: const BoxConstraints(minWidth: 0.0),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Transform.rotate(
                  angle: -math.pi / 2,
                  child: AppIcon(
                    path: IconPaths.back,
                    size: IconSize.small,
                    color: Theme.of(context).colorScheme.categorySelectField,
                  ),
                ),
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.categoryHint,
              style: AppStyles.bodySmallMedium(context).copyWith(
                color: Theme.of(context).colorScheme.categorySelectField,
              ),
            ),
          ),
          itemBuilder: (context) => [
            ...categories.map(
              (category) => PopupMenuItem(
                value: category.id,
                child: Text(
                  category.name,
                  style: AppStyles.bodySmallMedium(context).copyWith(
                    color: Theme.of(context).colorScheme.categorySelectField,
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              value: '__add__',
              child: Row(
                spacing: 8,
                children: [
                  Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.categorySelectField,
                  ),
                  Text(
                    AppLocalizations.of(context)!.addNewCategory,
                    style: AppStyles.bodySmallSemiBold(context).copyWith(
                      color: Theme.of(context).colorScheme.categorySelectField,
                    ),
                  ),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            FocusManager.instance.primaryFocus?.unfocus();

            if (value == '__add__') {
              onAddNewCategory();
            } else {
              onCategorySelected(value);
            }
          },
        ),
        if (selectedCategoryIds.isNotEmpty) ...[
          const SizedBox(height: 12.0),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 12.0,
              runSpacing: 8.0,
              children: selectedCategoryIds.map((id) {
                final category = categories.firstWhere((c) => c.id == id);

                return Chip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  label: Text(category.name),
                  labelStyle: AppStyles.bodySmallSemiBold(context).copyWith(
                    color: Theme.of(context).colorScheme.filterChipSelectedText,
                  ),
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.filterChipSelectedBackground,
                  onDeleted: () => onCategoryRemoved(id),
                  deleteIcon: AppIcon(
                    path: IconPaths.cancel,
                    size: IconSize.small,
                    color: Theme.of(context).colorScheme.chipDeleteIcon,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ],
    );
  }
}
