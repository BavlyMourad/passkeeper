import 'package:passkeeper/features/passwords/domain/models/password.dart';
import 'package:passkeeper/features/passwords/presentation/providers/passwords_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_passwords_provider.g.dart';

@riverpod
List<Password> filteredPasswords(
  Ref ref,
  String searchQuery,
  String? categoryId,
  bool? isFavourite,
) {
  final passwords = ref.watch(passwordsProvider);

  return passwords.where((p) {
    final matchesSearch = p.title.toLowerCase().contains(
      searchQuery.toLowerCase(),
    );

    final matchesCategory =
        categoryId == null || p.categoryIds.contains(categoryId);

    final matchesFavourite =
        isFavourite == null || p.isFavourite == isFavourite;

    return matchesSearch && matchesCategory && matchesFavourite;
  }).toList();
}
