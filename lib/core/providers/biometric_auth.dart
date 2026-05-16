import 'package:passkeeper/core/constants/shared_prefs_keys.dart';
import 'package:passkeeper/core/providers/shared_prefs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:local_auth/local_auth.dart';

part 'biometric_auth.g.dart';

@riverpod
class BiometricAuth extends _$BiometricAuth {
  @override
  bool build() {
    final prefs = ref.read(sharedPrefsProvider);
    return prefs.getBool(SharedPrefsKeys.biometricEnabled) ?? false;
  }

  Future<bool> toggle() async {
    final prefs = ref.read(sharedPrefsProvider);

    if (!state) {
      final localAuth = LocalAuthentication();
      final isAvailable = await localAuth.isDeviceSupported();
      final canCheck = await localAuth.canCheckBiometrics;

      if (!isAvailable || !canCheck) return false;
    }

    state = !state;
    await prefs.setBool(SharedPrefsKeys.biometricEnabled, state);
    return true;
  }
}
