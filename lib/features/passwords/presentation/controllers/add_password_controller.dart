import 'package:passkeeper/features/passwords/application/password_crypto_service.dart';
import 'package:passkeeper/features/passwords/data/password_repository.dart';
import 'package:passkeeper/features/passwords/domain/models/password.dart';
import 'package:passkeeper/features/passwords/presentation/providers/passwords_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'add_password_controller.g.dart';

@riverpod
class AddPasswordController extends _$AddPasswordController {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> submit(Password draftPassword) async {
    final cryptoService = ref.read(passwordCryptoServiceProvider);
    final passwordRepository = ref.read(passwordRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final encrypted = await cryptoService.encrypt(
        draftPassword.encryptedPassword,
      );

      final newPassword = draftPassword.copyWith(
        id: const Uuid().v4(),
        encryptedPassword: encrypted.ciphertext,
        iv: encrypted.iv,
      );

      await passwordRepository.save(newPassword);
      ref.invalidate(passwordsProvider);
    });
  }
}
