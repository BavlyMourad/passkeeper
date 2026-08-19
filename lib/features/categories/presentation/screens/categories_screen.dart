import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/widgets/app_logo_bar.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/features/categories/presentation/providers/categories_provider.dart';
import 'package:passkeeper/features/categories/presentation/widgets/category_action_chip.dart';
import 'package:passkeeper/features/categories/presentation/widgets/category_form_sheet.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  void _showCreateCategorySheet(BuildContext context) {
    AppUtils.showBottomModalSheet(
      context: context,
      child: const CategoryFormSheet(),
    );
  }

  void _navigateToCategoryDetails(BuildContext context, String categoryId) {
    context.push(AppRoutes.categoryDetailsPath(categoryId));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoriesProvider);

    return GradientBackground(
      begin: context.isDarkTheme ? Alignment.bottomRight : Alignment.centerLeft,
      end: context.isDarkTheme ? Alignment.topLeft : Alignment.topRight,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppLogoBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.horizontalPadding(context.isMobile),
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: SizeConfig.tabletConstrainedWidth(
                context.screenWidth,
                context.isMobile,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50.0),

                  Text(
                    AppLocalizations.of(context)!.categories,
                    style: AppStyles.headlineSemiBold(context),
                  ),

                  const SizedBox(height: 40.0),

                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 16.0,
                      runSpacing: 24.0,
                      children: [
                        CategoryActionChip(
                          avatarIconPath: IconPaths.add,
                          label: AppLocalizations.of(context)!.createNew,
                          onPressed: () => _showCreateCategorySheet(context),
                        ),

                        ...categories.map((category) {
                          return CategoryActionChip(
                            label: category.name,
                            onPressed: () => _navigateToCategoryDetails(
                              context,
                              category.id,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
