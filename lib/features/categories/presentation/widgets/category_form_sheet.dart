import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/errors/app_exception.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/widgets/app_text_field.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/core/widgets/loader.dart';
import 'package:passkeeper/features/categories/domain/models/category.dart';
import 'package:passkeeper/features/categories/presentation/controllers/categories_controller.dart';

class CategoryFormSheet extends ConsumerStatefulWidget {
  const CategoryFormSheet({
    super.key,
    this.initialName,
    this.onNameSubmitted,
    this.onCategoryCreated,
  });

  final String? initialName;
  final ValueChanged<String>? onNameSubmitted;
  final ValueChanged<String>? onCategoryCreated;

  @override
  ConsumerState<CategoryFormSheet> createState() => _CategoryFormSheetState();
}

class _CategoryFormSheetState extends ConsumerState<CategoryFormSheet> {
  late final _categoryNameController = TextEditingController(
    text: widget.initialName ?? '',
  );

  String _error = '';

  bool get _isEditing => widget.onNameSubmitted != null;

  void _submit() {
    if (_isEditing) {
      final name = _categoryNameController.text.trim();
      if (name.isEmpty) {
        setState(
          () => _error = AppLocalizations.of(context)!.categoryNameEmpty,
        );
        return;
      }
      widget.onNameSubmitted!(name);
      context.pop();
      return;
    }

    ref
        .read(categoriesControllerProvider.notifier)
        .createCategory(_categoryNameController.text);
  }

  @override
  void dispose() {
    _categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isEditing) {
      ref.listen<AsyncValue<Category?>>(categoriesControllerProvider, (
        previous,
        next,
      ) {
        next.when(
          loading: () => const Loader(),
          error: (error, _) {
            setState(() {
              _error = switch (error) {
                DuplicateCategoryNameException() => AppLocalizations.of(
                  context,
                )!.categoryNameExists,
                EmptyCategoryNameException() => AppLocalizations.of(
                  context,
                )!.categoryNameEmpty,
                _ => AppLocalizations.of(context)!.genericError,
              };
            });
          },
          data: (category) {
            if (previous?.isLoading == true) {
              _categoryNameController.clear();
              setState(() => _error = '');
              if (category != null) {
                widget.onCategoryCreated?.call(category.id);
              }
              AppUtils.showSnackBar(
                context: context,
                message: AppLocalizations.of(context)!.categoryCreated,
                color: Theme.of(context).colorScheme.snackBar,
              );
              context.pop();
            }
          },
        );
      });
    }

    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: SizeConfig.tabletConstrainedWidth(
          context.screenWidth,
          context.isMobile,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _isEditing
                  ? AppLocalizations.of(context)!.renameCategory
                  : AppLocalizations.of(context)!.addNewCategory,
              style: AppStyles.headlineSemiBold(context),
            ),
            const SizedBox(height: 16.0),
            AppTextField(
              controller: _categoryNameController,
              prefixIconPath: IconPaths.categories2,
              labelText: AppLocalizations.of(context)!.categoryName,
              textCapitalization: TextCapitalization.sentences,
            ),
            if (_error.isNotEmpty) ...[
              const SizedBox(height: 8.0),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  _error,
                  style: AppStyles.bodySmallMedium(
                    context,
                  ).copyWith(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
            const SizedBox(height: 16.0),
            CustomButton(
              onPressed: _submit,
              title: _isEditing
                  ? AppLocalizations.of(context)!.done
                  : AppLocalizations.of(context)!.create,
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
