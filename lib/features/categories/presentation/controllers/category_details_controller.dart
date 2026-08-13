import 'package:passkeeper/core/errors/app_exception.dart';
import 'package:passkeeper/features/categories/data/category_repository.dart';
import 'package:passkeeper/features/categories/domain/models/category.dart';
import 'package:passkeeper/features/categories/presentation/providers/categories_provider.dart';
import 'package:passkeeper/features/passwords/application/password_category_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_details_controller.g.dart';

@riverpod
class CategoryDetailsController extends _$CategoryDetailsController {
  @override
  Future<Category> build(String id) async {
    final repository = ref.watch(categoryRepositoryProvider);
    final category = repository.getById(id);

    if (category == null) {
      throw CategoryNotFoundException();
    }

    return category;
  }

  Future<void> rename(String newName) async {
    final repository = ref.read(categoryRepositoryProvider);
    final current = state.requireValue;

    final result = await AsyncValue.guard(() async {
      final updated = current.copyWith(
        name: newName,
        updatedAt: DateTime.now(),
      );

      await repository.save(updated);
      ref.invalidate(categoriesProvider);

      return updated;
    });

    if (!ref.mounted) return;

    state = result;
  }

  Future<void> updateMembership({
    List<String> toAdd = const [],
    List<String> toRemove = const [],
  }) async {
    if (toAdd.isEmpty && toRemove.isEmpty) return;

    final service = ref.read(passwordCategoryServiceProvider);
    final current = state.requireValue;

    final result = await AsyncValue.guard(() async {
      await service.updateCategoryMembership(
        id,
        toAdd: toAdd,
        toRemove: toRemove,
      );
      return current;
    });

    if (!ref.mounted) return;
    state = result;
  }

  Future<void> delete() async {
    final service = ref.read(passwordCategoryServiceProvider);

    final result = await AsyncValue.guard(() async {
      await service.deleteCategory(id);

      return state.requireValue;
    });

    if (!ref.mounted) return;

    state = result;
  }
}
