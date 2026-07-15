import 'package:passkeeper/features/passwords/data/password_repository.dart';
import 'package:passkeeper/features/passwords/presentation/controllers/password_details_controller.dart';
import 'package:passkeeper/features/passwords/presentation/providers/passwords_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'password_service.g.dart';

@riverpod
PasswordService passwordService(Ref ref) {
  final passwordRepository = ref.watch(passwordRepositoryProvider);

  return PasswordService(passwordRepository, ref);
}

class PasswordService {
  PasswordService(this._repository, this._ref);

  final PasswordRepository _repository;
  final Ref _ref;

  Future<void> toggleFavourite(String id) async {
    final password = _repository.getById(id);

    if (password == null) return;

    await _repository.save(
      password.copyWith(isFavourite: !password.isFavourite),
    );

    _ref.invalidate(passwordsProvider);
    _ref.invalidate(passwordDetailsControllerProvider);
  }
}
