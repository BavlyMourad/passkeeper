// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_crypto_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(passwordCryptoService)
final passwordCryptoServiceProvider = PasswordCryptoServiceProvider._();

final class PasswordCryptoServiceProvider
    extends
        $FunctionalProvider<
          PasswordCryptoService,
          PasswordCryptoService,
          PasswordCryptoService
        >
    with $Provider<PasswordCryptoService> {
  PasswordCryptoServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordCryptoServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordCryptoServiceHash();

  @$internal
  @override
  $ProviderElement<PasswordCryptoService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PasswordCryptoService create(Ref ref) {
    return passwordCryptoService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PasswordCryptoService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PasswordCryptoService>(value),
    );
  }
}

String _$passwordCryptoServiceHash() =>
    r'e07f090ca5ff3d18cb6a569d04c0bad1c9db37ca';
