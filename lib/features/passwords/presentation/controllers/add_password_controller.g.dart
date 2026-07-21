// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_password_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddPasswordController)
final addPasswordControllerProvider = AddPasswordControllerProvider._();

final class AddPasswordControllerProvider
    extends $NotifierProvider<AddPasswordController, AsyncValue<void>> {
  AddPasswordControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addPasswordControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addPasswordControllerHash();

  @$internal
  @override
  AddPasswordController create() => AddPasswordController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$addPasswordControllerHash() =>
    r'594766a7d8110bc2549431f89fdfea7c9b7852e7';

abstract class _$AddPasswordController extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
