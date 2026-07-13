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
        isAutoDispose: true,
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

String _$passwordServiceHash() => r'e14e8d5986cc93a43c47c95c782c3250f4014712';
