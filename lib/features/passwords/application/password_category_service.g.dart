// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_category_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(passwordCategoryService)
final passwordCategoryServiceProvider = PasswordCategoryServiceProvider._();

final class PasswordCategoryServiceProvider
    extends
        $FunctionalProvider<
          PasswordCategoryService,
          PasswordCategoryService,
          PasswordCategoryService
        >
    with $Provider<PasswordCategoryService> {
  PasswordCategoryServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordCategoryServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordCategoryServiceHash();

  @$internal
  @override
  $ProviderElement<PasswordCategoryService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PasswordCategoryService create(Ref ref) {
    return passwordCategoryService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PasswordCategoryService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PasswordCategoryService>(value),
    );
  }
}

String _$passwordCategoryServiceHash() =>
    r'bd5848898f5c98bdcc7822d049a0a80dd002f1c9';
