import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/core/widgets/app_logo_bar.dart';
import 'package:passkeeper/core/widgets/app_text_field.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/features/passwords/application/password_service.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';
import 'package:passkeeper/features/passwords/presentation/providers/filtered_passwords_provider.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/category_filter_chips.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/no_passwords_yet.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/passwords_list.dart';

class FavouritesScreen extends ConsumerStatefulWidget {
  const FavouritesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavouritesScreenState();
}

class _FavouritesScreenState extends ConsumerState<FavouritesScreen> {
  late final TextEditingController _searchController;
  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
  }

  void _toggleFavourite(String passwordId) {
    ref.read(passwordServiceProvider).toggleFavourite(passwordId);
  }

  Future<void> _copyPassword(Password password) async {
    await ref
        .read(passwordServiceProvider)
        .copy(ciphertext: password.encryptedPassword, iv: password.iv);

    if (!mounted) return;

    AppUtils.showSnackBar(
      context: context,
      message: AppLocalizations.of(context)!.copied,
      color: Theme.of(context).colorScheme.snackBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = _searchController.text.trim();

    final filteredPasswords = ref.watch(
      filteredPasswordsProvider(searchQuery, _selectedCategoryId, true, true),
    );

    final isVaultEmpty =
        searchQuery.isEmpty &&
        filteredPasswords.isEmpty &&
        _selectedCategoryId == null;

    final hasNoResults = filteredPasswords.isEmpty;

    return GradientBackground(
      begin: context.isDarkTheme ? Alignment.bottomRight : Alignment.centerLeft,
      end: context.isDarkTheme ? Alignment.topLeft : Alignment.topRight,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppLogoBar(),
        body: isVaultEmpty
            ? const Center(child: NoPasswordsYet(isFavourites: true))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50.0),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.horizontalPadding(
                        context.isMobile,
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.favourites,
                      style: AppStyles.headlineSemiBold(context),
                    ),
                  ),

                  const SizedBox(height: 40.0),

                  // Search bar
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.horizontalPadding(
                        context.isMobile,
                      ),
                    ),
                    child: AppTextField(
                      controller: _searchController,
                      prefixIconPath: IconPaths.search,
                      labelText: AppLocalizations.of(context)!.search,
                    ),
                  ),

                  const SizedBox(height: 24.0),

                  // Category filter chips
                  CategoryFilterChips(
                    selectedCategoryId: _selectedCategoryId,
                    onCategorySelected: (categoryId) {
                      setState(() {
                        _selectedCategoryId = categoryId;
                      });
                    },
                  ),

                  const SizedBox(height: 40.0),

                  // Passwords list
                  hasNoResults
                      ? Center(
                          child: Text(
                            AppLocalizations.of(
                              context,
                            )!.noMatchingPasswordsFound,
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.horizontalPadding(
                                context.isMobile,
                              ),
                            ),
                            child: PasswordsList(
                              passwords: filteredPasswords,
                              onPasswordTap: (context, password) {
                                context.push(
                                  AppRoutes.favouritePasswordDetailsPath(
                                    password.id,
                                  ),
                                );
                              },
                              trailingBuilder: (context, password) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          _toggleFavourite(password.id),
                                      icon: AppIcon(
                                        path: password.isFavourite
                                            ? IconPaths.favourite
                                            : IconPaths.favouriteOutline,
                                        size: IconSize.small,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSecondary,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => _copyPassword(password),
                                      icon: AppIcon(
                                        path: IconPaths.copy,
                                        size: IconSize.medium,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSecondary,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}
