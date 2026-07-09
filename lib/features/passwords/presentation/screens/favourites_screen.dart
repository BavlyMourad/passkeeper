import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/app_strings.dart';
import 'package:passkeeper/core/constants/image_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_image.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/core/widgets/language_selection_button.dart';
import 'package:passkeeper/core/widgets/theme_toggle_button.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/add_password_fab.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/category_filter_chips.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/passwords_list.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/search_and_filter_bar.dart';

class FavouritesScreen extends ConsumerWidget {
  const FavouritesScreen({super.key});

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
          actions: [
            const LanguageSelectionButton(),
            Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.horizontalPadding(context.isMobile),
              ),
              child: const ThemeToggleButton(),
            ),
          ],
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // No passwords yet
            // TODO: handle later when we create controller
            // const NoPasswordsYet(),
            SizedBox(height: 24.0),

            // Search and filter bar
            SearchAndFilterBar(),

            SizedBox(height: 24.0),

            // Category filter chips
            CategoryFilterChips(),

            SizedBox(height: 40.0),

            // Passwords list
            Expanded(
              child: PasswordsList(
                isFavourite: true,
                source: PasswordDetailsSource.favourites,
              ),
            ),
          ],
        ),
        floatingActionButton: const AddPasswordFab(),
      ),
    );
  }
}
