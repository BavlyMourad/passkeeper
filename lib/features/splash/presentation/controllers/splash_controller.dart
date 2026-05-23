import 'package:passkeeper/core/providers/is_first_time_user.dart';
import 'package:passkeeper/features/auth/application/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  Future<void> build() async {
    // keep splash visible briefly for UX
    await Future.delayed(const Duration(seconds: 1));

    final authService = ref.read(authServiceProvider);
    final isFirstTime = await authService.isFirstTime();

    ref.read(isFirstTimeUserProvider.notifier).state = isFirstTime;
  }
}
