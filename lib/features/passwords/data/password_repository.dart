import 'dart:convert';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:passkeeper/core/providers/boxes.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_repository.g.dart';

@riverpod
PasswordRepository passwordRepository(Ref ref) {
  final passwordsBox = ref.watch(passwordsBoxProvider);

  return PasswordRepository(passwordsBox);
}

class PasswordRepository {
  PasswordRepository(this._box);

  final Box<String> _box;

  List<Password> getAll() =>
      _box.values.map((json) => Password.fromJson(jsonDecode(json))).toList();

  Password? getById(String id) {
    final json = _box.get(id);
    return json == null ? null : Password.fromJson(jsonDecode(json));
  }

  Future<void> save(Password password) =>
      _box.put(password.id, jsonEncode(password.toJson()));

  Future<void> delete(String id) => _box.delete(id);
}
