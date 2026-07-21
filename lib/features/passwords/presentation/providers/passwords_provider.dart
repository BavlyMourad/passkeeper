import 'package:passkeeper/features/passwords/data/password_repository.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'passwords_provider.g.dart';

@riverpod
List<Password> passwords(Ref ref) {
  return ref.watch(passwordRepositoryProvider).getAll();
}
