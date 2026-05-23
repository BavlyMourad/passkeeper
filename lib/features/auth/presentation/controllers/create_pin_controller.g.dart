// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_pin_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreatePinController)
final createPinControllerProvider = CreatePinControllerProvider._();

final class CreatePinControllerProvider
    extends $NotifierProvider<CreatePinController, AsyncValue<void>> {
  CreatePinControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createPinControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createPinControllerHash();

  @$internal
  @override
  CreatePinController create() => CreatePinController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$createPinControllerHash() =>
    r'275d3e47a44e9341b3308f7c86d11bbe7c1bd9bb';

abstract class _$CreatePinController extends $Notifier<AsyncValue<void>> {
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
