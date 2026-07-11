import 'dart:convert';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:passkeeper/core/providers/boxes.dart';
import 'package:passkeeper/features/categories/domain/models/category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_repository.g.dart';

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  final categoriesBox = ref.watch(categoriesBoxProvider);

  return CategoryRepository(categoriesBox);
}

class CategoryRepository {
  CategoryRepository(this._box);

  final Box<String> _box;

  List<Category> getAll() =>
      _box.values.map((json) => Category.fromJson(jsonDecode(json))).toList();

  Category? getById(String id) {
    final json = _box.get(id);

    return json == null ? null : Category.fromJson(jsonDecode(json));
  }

  Future<void> save(Category category) =>
      _box.put(category.id, jsonEncode(category.toJson()));

  Future<void> delete(String id) => _box.delete(id);
}
