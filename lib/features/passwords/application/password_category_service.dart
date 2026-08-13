import 'package:passkeeper/features/categories/data/category_repository.dart';
import 'package:passkeeper/features/categories/domain/models/category.dart';
import 'package:passkeeper/features/categories/presentation/providers/categories_provider.dart';
import 'package:passkeeper/features/passwords/data/password_repository.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';
import 'package:passkeeper/features/passwords/presentation/providers/passwords_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_category_service.g.dart';

@Riverpod(keepAlive: true)
PasswordCategoryService passwordCategoryService(Ref ref) {
  final passwordRepository = ref.watch(passwordRepositoryProvider);
  final categoryRepository = ref.watch(categoryRepositoryProvider);

  return PasswordCategoryService(passwordRepository, categoryRepository, ref);
}

class PasswordCategoryService {
  PasswordCategoryService(
    this._passwordRepository,
    this._categoryRepository,
    this._ref,
  );

  final PasswordRepository _passwordRepository;
  final CategoryRepository _categoryRepository;
  final Ref _ref;

  List<Category> getCategoriesForPassword(String passwordId) {
    final password = _passwordRepository.getById(passwordId);

    if (password == null) return [];

    return password.categoryIds
        .map(_categoryRepository.getById)
        .whereType<Category>()
        .toList();
  }

  List<Password> getPasswordsForCategory(String categoryId) {
    return _passwordRepository
        .getAll()
        .where((password) => password.categoryIds.contains(categoryId))
        .toList();
  }

  Future<void> updateCategoryMembership(
    String categoryId, {
    List<String> toAdd = const [],
    List<String> toRemove = const [],
  }) async {
    for (final passwordId in toAdd) {
      final password = _passwordRepository.getById(passwordId);
      if (password == null) continue;
      if (password.categoryIds.contains(categoryId)) continue;

      await _passwordRepository.save(
        password.copyWith(categoryIds: [...password.categoryIds, categoryId]),
      );
    }

    for (final passwordId in toRemove) {
      final password = _passwordRepository.getById(passwordId);
      if (password == null) continue;

      await _passwordRepository.save(
        password.copyWith(
          categoryIds: password.categoryIds
              .where((id) => id != categoryId)
              .toList(),
        ),
      );
    }

    _ref.invalidate(passwordsProvider);
  }

  Future<void> deleteCategory(String categoryId) async {
    await _categoryRepository.delete(categoryId);

    final affectedPasswords = getPasswordsForCategory(categoryId);

    for (final password in affectedPasswords) {
      final updatedPassword = password.copyWith(
        categoryIds: password.categoryIds
            .where((id) => id != categoryId)
            .toList(),
      );

      await _passwordRepository.save(updatedPassword);
    }

    _ref.invalidate(passwordsProvider);
    _ref.invalidate(categoriesProvider);
  }
}
