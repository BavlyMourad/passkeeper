import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/features/categories/presentation/providers/categories_provider.dart';

class CategoryViewField extends ConsumerWidget {
  const CategoryViewField({super.key, required this.categoryIds});

  final List<String> categoryIds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);

    return InputDecorator(
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
      ),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: categoryIds.map((id) {
          final category = categories.firstWhere((c) => c.id == id);

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.filterChipSelectedBackground,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              category.name,
              style: AppStyles.bodySmallSemiBold(context).copyWith(
                color: Theme.of(context).colorScheme.filterChipSelectedText,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
