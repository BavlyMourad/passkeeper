import 'package:passkeeper/features/auth/application/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_pin_controller.g.dart';

@riverpod
class CreatePinController extends _$CreatePinController {
  @override
  AsyncValue<void> build() => const AsyncData(null); // idle state

  Future<void> setupPin(String pin, String confirmPin) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => ref.read(authServiceProvider).setupPin(pin),
    );
  }
}
