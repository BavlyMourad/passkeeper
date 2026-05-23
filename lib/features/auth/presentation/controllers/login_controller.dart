import 'package:passkeeper/features/auth/application/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  AsyncValue<void> build() => const AsyncData(null); // idle state

  Future<void> loginWithPin(String pin) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authServiceProvider).loginWithPin(pin),
    );
  }

  Future<void> loginWithBiometric() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(authServiceProvider).loginWithBiometric(),
    );
  }
}
