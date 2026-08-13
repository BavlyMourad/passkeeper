import 'package:passkeeper/features/categories/data/category_repository.dart';
import 'package:passkeeper/features/categories/domain/models/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_provider.g.dart';

@riverpod
List<Category> categories(Ref ref) {
  return ref.watch(categoryRepositoryProvider).getAll();
}
