// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_auth.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BiometricAuth)
final biometricAuthProvider = BiometricAuthProvider._();

final class BiometricAuthProvider
    extends $NotifierProvider<BiometricAuth, bool> {
  BiometricAuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricAuthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricAuthHash();

  @$internal
  @override
  BiometricAuth create() => BiometricAuth();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$biometricAuthHash() => r'9393511d343aa2bd2f9805734d45e89b6a541b74';

abstract class _$BiometricAuth extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
