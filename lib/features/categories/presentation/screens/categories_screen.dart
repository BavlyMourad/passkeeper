import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/core/constants/app_strings.dart';
import 'package:passkeeper/core/constants/dummy_data.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/image_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/widgets/app_image.dart';
import 'package:passkeeper/core/widgets/app_text_field.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/search_and_filter_bar.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GradientBackground(
      begin: context.isDarkTheme ? Alignment.bottomRight : Alignment.centerLeft,
      end: context.isDarkTheme ? Alignment.topLeft : Alignment.topRight,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0.0,
          titleSpacing: 0.0,
          title: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.horizontalPadding(context.isMobile),
            ),
            child: Row(
              spacing: 8.0,
              children: [
                AppImage(
                  path: ImagePaths.logo,
                  mobileSize: 32.0,
                  tabletSize: 48.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(
                  AppStrings.appName,
                  style: AppStyles.titleLargeSemiBold(context),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0),

            // TODO: REMOVE FROM ALL WIDGETS AND PUT IT IN SCREENS
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.horizontalPadding(context.isMobile),
              ),
              child: Text(
                'Categories',
                style: AppStyles.headlineSemiBold(context),
              ),
            ),

            const SizedBox(height: 40.0),

            // Search and filter bar
            const SearchAndFilterBar(),

            const SizedBox(height: 24.0),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.horizontalPadding(context.isMobile),
              ),
              child: Wrap(
                spacing: 16.0,
                runSpacing: 24.0,
                children: [
                  ActionChip(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    avatar: const Icon(Icons.add, size: 18),
                    label: const Text("Create New"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(50.0),
                    ),
                    onPressed: () {
                      AppUtils.showBottomModalSheet(
                        context: context,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Add New Category",
                              style: AppStyles.headlineSemiBold(context),
                            ),
                            const SizedBox(height: 16.0),
                            const AppTextField(
                              prefixIconPath: IconPaths.categories2,
                              labelText: 'Category name',
                            ),
                            const SizedBox(height: 16.0),
                            CustomButton(onPressed: () {}, title: 'Create'),
                            const SizedBox(height: 24.0),
                          ],
                        ),
                      );
                    },
                  ),

                  ...dummyCategories.map((category) {
                    return ActionChip(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      label: Text(category.name),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(50.0),
                      ),
                      onPressed: () {
                        print(
                          'Category ID: ${category.id}, Category Name: ${category.name}',
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
