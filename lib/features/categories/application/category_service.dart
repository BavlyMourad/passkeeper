import 'package:passkeeper/core/errors/app_exception.dart';
import 'package:passkeeper/features/categories/data/category_repository.dart';
import 'package:passkeeper/features/categories/domain/models/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'category_service.g.dart';

@riverpod
CategoryService categoryService(Ref ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);

  return CategoryService(categoryRepository);
}

class CategoryService {
  CategoryService(this._repository);

  final CategoryRepository _repository;

  Future<Category> createCategory(String name) async {
    final trimmedName = name.trim();

    if (trimmedName.isEmpty) {
      throw EmptyCategoryNameException();
    }

    final nameExists = _repository.getAll().any(
      (category) => category.name.toLowerCase() == trimmedName.toLowerCase(),
    );

    if (nameExists) {
      throw DuplicateCategoryNameException();
    }

    final now = DateTime.now();

    final category = Category(
      id: const Uuid().v4(),
      name: trimmedName,
      createdAt: now,
      updatedAt: now,
    );

    await _repository.save(category);

    return category;
  }
}
