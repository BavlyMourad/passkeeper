// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(passwordRepository)
final passwordRepositoryProvider = PasswordRepositoryProvider._();

final class PasswordRepositoryProvider
    extends
        $FunctionalProvider<
          PasswordRepository,
          PasswordRepository,
          PasswordRepository
        >
    with $Provider<PasswordRepository> {
  PasswordRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordRepositoryHash();

  @$internal
  @override
  $ProviderElement<PasswordRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PasswordRepository create(Ref ref) {
    return passwordRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PasswordRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PasswordRepository>(value),
    );
  }
}

String _$passwordRepositoryHash() =>
    r'fa6956fb0c4512324589a0f34a8d5c43be853317';
