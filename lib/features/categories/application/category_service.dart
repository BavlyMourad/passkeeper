import 'package:passkeeper/features/categories/data/category_repository.dart';
import 'package:passkeeper/features/categories/domain/models/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_service.g.dart';

@riverpod
CategoryService categoryService(Ref ref) {
  final categoryRepository = ref.watch(categoryRepositoryProvider);

  return CategoryService(categoryRepository);
}

class CategoryService {
  CategoryService(this._repository);

  final CategoryRepository _repository;

  List<Category> getAllCategories() => _repository.getAll();

  Future<void> createCategory(Category category) => _repository.save(category);
}
