// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_lock_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VaultLockManager)
final vaultLockManagerProvider = VaultLockManagerProvider._();

final class VaultLockManagerProvider
    extends $NotifierProvider<VaultLockManager, void> {
  VaultLockManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vaultLockManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vaultLockManagerHash();

  @$internal
  @override
  VaultLockManager create() => VaultLockManager();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$vaultLockManagerHash() => r'86e6d0ae9f76d7499a68a4b341dbd9996dbbe1fa';

abstract class _$VaultLockManager extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
