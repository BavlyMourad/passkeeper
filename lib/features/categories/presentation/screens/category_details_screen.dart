import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/config/theme/app_colors.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/core/widgets/app_text_field.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/core/widgets/details_app_bar.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';
import 'package:passkeeper/core/widgets/loader.dart';
import 'package:passkeeper/features/categories/presentation/controllers/category_details_controller.dart';
import 'package:passkeeper/features/categories/presentation/widgets/category_form_sheet.dart';
import 'package:passkeeper/features/passwords/application/password_service.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';
import 'package:passkeeper/features/passwords/presentation/providers/filtered_passwords_provider.dart';
import 'package:passkeeper/core/widgets/app_dialog.dart';
import 'package:passkeeper/features/passwords/presentation/widgets/passwords_list.dart';

class CategoryDetailsScreen extends ConsumerStatefulWidget {
  const CategoryDetailsScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends ConsumerState<CategoryDetailsScreen> {
  late final TextEditingController _searchController;
  bool _isEditingMode = false;

  final Set<String> _pendingAdd = {};
  final Set<String> _pendingRemove = {};
  String? _pendingName;

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

  void _toggleEditMode() => setState(() {
    _isEditingMode = !_isEditingMode;
    _pendingAdd.clear();
    _pendingRemove.clear();
    _pendingName = null;
  });

  bool _isPendingMember(Password password) {
    final persisted = password.categoryIds.contains(widget.id);

    if (_pendingRemove.contains(password.id)) return false;
    if (_pendingAdd.contains(password.id)) return true;

    return persisted;
  }

  void _toggleMembership(Password password) {
    final persisted = password.categoryIds.contains(widget.id);

    setState(() {
      if (persisted) {
        if (_pendingRemove.contains(password.id)) {
          _pendingRemove.remove(password.id);
        } else {
          _pendingRemove.add(password.id);
        }
      } else {
        if (_pendingAdd.contains(password.id)) {
          _pendingAdd.remove(password.id);
        } else {
          _pendingAdd.add(password.id);
        }
      }
    });
  }

  void _saveChanges() async {
    if (_pendingName != null) {
      await ref
          .read(categoryDetailsControllerProvider(widget.id).notifier)
          .rename(_pendingName!);
    }

    await ref
        .read(categoryDetailsControllerProvider(widget.id).notifier)
        .updateMembership(
          toAdd: _pendingAdd.toList(),
          toRemove: _pendingRemove.toList(),
        );

    if (!mounted) return;

    _toggleEditMode();

    AppUtils.showSnackBar(
      context: context,
      message: AppLocalizations.of(context)!.categorySaved,
      color: Theme.of(context).colorScheme.snackBar,
    );
  }

  void _deleteCategory(String categoryId) {
    AppUtils.showAppDialog(
      context: context,
      child: SizedBox(
        width: SizeConfig.tabletConstrainedWidth(
          context.screenWidth,
          context.isMobile,
        ),
        child: AppDialog(
          title: AppLocalizations.of(context)!.confirmDeleteCategory,
          subtitle: AppLocalizations.of(context)!.actionCanNotBeUndone,
          onTap: () async {
            await ref
                .read(categoryDetailsControllerProvider(categoryId).notifier)
                .delete();

            if (!mounted) return;

            AppUtils.showSnackBar(
              context: context,
              message: AppLocalizations.of(context)!.categoryDeleted,
            );

            context.pop();
          },
        ),
      ),
    );
  }

  void _copyPassword(Password password) async {
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
    final categoryState = ref.watch(
      categoryDetailsControllerProvider(widget.id),
    );

    final searchQuery = _searchController.text.trim();
    final String? categoryId = _isEditingMode ? null : widget.id;

    final filteredPasswords = ref.watch(
      filteredPasswordsProvider(searchQuery, categoryId, null, true),
    );

    final isVaultEmpty =
        searchQuery.isEmpty && filteredPasswords.isEmpty && categoryId != null;

    final hasNoResults = filteredPasswords.isEmpty;

    return GradientBackground(
      begin: context.isDarkTheme ? Alignment.bottomRight : Alignment.centerLeft,
      end: context.isDarkTheme ? Alignment.topLeft : Alignment.topRight,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: DetailsAppBar(isEditingMode: _isEditingMode),
        body: categoryState.when(
          loading: () => const Loader(),
          error: (error, _) =>
              Center(child: Text(AppLocalizations.of(context)!.genericError)),
          data: (category) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.horizontalPadding(context.isMobile),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 50.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                _pendingName ?? category.name,
                                style: AppStyles.headlineSemiBold(context),
                              ),
                              if (_isEditingMode)
                                IconButton(
                                  onPressed: () {
                                    AppUtils.showBottomModalSheet(
                                      context: context,
                                      child: CategoryFormSheet(
                                        initialName:
                                            _pendingName ?? category.name,
                                        onNameSubmitted: (name) =>
                                            setState(() => _pendingName = name),
                                      ),
                                    );
                                  },
                                  icon: AppIcon(
                                    path: IconPaths.rename,
                                    size: IconSize.small,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.editButton,
                                  ),
                                ),
                            ],
                          ),

                          IconButton(
                            onPressed: _isEditingMode
                                ? () => _deleteCategory(category.id)
                                : _toggleEditMode,
                            icon: AppIcon(
                              path: _isEditingMode
                                  ? IconPaths.delete
                                  : IconPaths.edit,
                              size: IconSize.small,
                              color: Theme.of(context).colorScheme.editButton,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40.0),

                      // Search bar
                      AppTextField(
                        controller: _searchController,
                        prefixIconPath: IconPaths.search,
                        labelText: AppLocalizations.of(context)!.search,
                      ),

                      const SizedBox(height: 24.0),

                      // Passwords list
                      isVaultEmpty
                          ? Center(
                              child: Text(
                                AppLocalizations.of(context)!.empty,
                                textAlign: TextAlign.center,
                                style: AppStyles.bodyRegular(context),
                              ),
                            )
                          : hasNoResults
                          ? Center(
                              child: Text(
                                AppLocalizations.of(
                                  context,
                                )!.noMatchingPasswordsFound,
                              ),
                            )
                          : Expanded(
                              child: PasswordsList(
                                passwords: filteredPasswords,
                                onPasswordTap: (context, password) {
                                  context.push(
                                    AppRoutes.categoryPasswordDetailsPath(
                                      widget.id,
                                      password.id,
                                    ),
                                  );
                                },
                                trailingBuilder: (context, password) {
                                  final isMember = _isPendingMember(password);

                                  return _isEditingMode
                                      ? IconButton(
                                          onPressed: () =>
                                              _toggleMembership(password),
                                          icon: AppIcon(
                                            path: isMember
                                                ? IconPaths.remove
                                                : IconPaths.add,
                                            size: IconSize.small,
                                            color: isMember
                                                ? AppColors.redSoft
                                                : Theme.of(
                                                    context,
                                                  ).colorScheme.addIconButton,
                                          ),
                                        )
                                      : IconButton(
                                          onPressed: () =>
                                              _copyPassword(password),
                                          icon: AppIcon(
                                            path: IconPaths.copy,
                                            size: IconSize.medium,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSecondary,
                                          ),
                                        );
                                },
                              ),
                            ),
                    ],
                  ),

                  if (_isEditingMode)
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      bottom: 23.0,
                      child: Center(
                        child: SizedBox(
                          width: SizeConfig.tabletConstrainedWidth(
                            context.screenWidth,
                            context.isMobile,
                          ),
                          child: CustomButton(
                            onPressed: _saveChanges,
                            prefixIconPath: IconPaths.save,
                            title: AppLocalizations.of(context)!.saveChanges,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
