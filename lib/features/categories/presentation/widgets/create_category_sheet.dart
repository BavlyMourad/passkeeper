import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/constants/size_config.dart';
import 'package:passkeeper/core/errors/app_exception.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_text_field.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:passkeeper/core/widgets/loader.dart';
import 'package:passkeeper/features/categories/domain/models/category.dart';
import 'package:passkeeper/features/categories/presentation/controllers/categories_controller.dart';

class CreateCategorySheet extends ConsumerStatefulWidget {
  const CreateCategorySheet({super.key, this.onCategoryCreated});

  final ValueChanged<String>? onCategoryCreated;

  @override
  ConsumerState<CreateCategorySheet> createState() =>
      _CreateCategorySheetState();
}

class _CreateCategorySheetState extends ConsumerState<CreateCategorySheet> {
  final _categoryNameController = TextEditingController();
  String _error = '';

  void _createCategory() {
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
            context.pop();
          }
        },
      );
    });

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
              AppLocalizations.of(context)!.addNewCategory,
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
              onPressed: _createCategory,
              title: AppLocalizations.of(context)!.create,
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
