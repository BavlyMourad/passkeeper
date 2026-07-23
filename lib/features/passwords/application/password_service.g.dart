// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(passwordService)
final passwordServiceProvider = PasswordServiceProvider._();

final class PasswordServiceProvider
    extends
        $FunctionalProvider<PasswordService, PasswordService, PasswordService>
    with $Provider<PasswordService> {
  PasswordServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordServiceHash();

  @$internal
  @override
  $ProviderElement<PasswordService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PasswordService create(Ref ref) {
    return passwordService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PasswordService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PasswordService>(value),
    );
  }
}

String _$passwordServiceHash() => r'72df28b53688cc11b7c828023bf8101ce441780c';
