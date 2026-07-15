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
        isAutoDispose: true,
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
    r'19b87b8e7566fd369fa11ac592a5bee84bf17a44';
