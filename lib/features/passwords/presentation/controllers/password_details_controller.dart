import 'package:passkeeper/core/errors/app_exception.dart';
import 'package:passkeeper/features/categories/application/category_service.dart';
import 'package:passkeeper/features/categories/presentation/providers/categories_provider.dart';
import 'package:passkeeper/features/passwords/application/password_crypto_service.dart';
import 'package:passkeeper/features/passwords/data/password_repository.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';
import 'package:passkeeper/features/passwords/presentation/providers/passwords_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_details_controller.g.dart';

@riverpod
class PasswordDetailsController extends _$PasswordDetailsController {
  @override
  Future<Password> build(String id) async {
    final repository = ref.read(passwordRepositoryProvider);

    final password = repository.getById(id);

    if (password == null) throw PasswordNotFoundException();

    return password;
  }

  // Called on: reveal tap (view mode), copy tap, entering edit mode.
  Future<String> decryptPassword() async {
    final cryptoService = ref.read(passwordCryptoServiceProvider);

    // Get value directly
    final password = state.requireValue;

    return cryptoService.decrypt(
      ciphertext: password.encryptedPassword,
      iv: password.iv,
    );
  }

  Future<void> updatePassword(Password editedPassword) async {
    final cryptoService = ref.read(passwordCryptoServiceProvider);
    final repository = ref.read(passwordRepositoryProvider);

    state = await AsyncValue.guard(() async {
      final encrypted = await cryptoService.encrypt(
        editedPassword.encryptedPassword,
      );

      final updatedPassword = editedPassword.copyWith(
        encryptedPassword: encrypted.ciphertext,
        iv: encrypted.iv,
        updatedAt: DateTime.now(),
      );

      await repository.save(updatedPassword);

      ref.invalidate(passwordsProvider);

      return updatedPassword;
    });
  }

  Future<void> deletePassword() async {
    final repository = ref.read(passwordRepositoryProvider);

    final current = state.requireValue;

    state = await AsyncValue.guard(() async {
      await repository.delete(id);

      ref.invalidate(passwordsProvider);

      return current;
    });
  }

  Future<void> createCategory(String name) async {
    final service = ref.read(categoryServiceProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await service.createCategory(name);
      ref.invalidate(categoriesProvider);

      return state.requireValue;
    });
  }
}
