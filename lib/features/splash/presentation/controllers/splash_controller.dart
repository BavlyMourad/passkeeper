import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  Future<void> build() async {
    // TODO: Add logic later (if user has saved KEK → route to login or first-time setup)
    await Future.delayed(const Duration(seconds: 3));
  }
}
