// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'awaiting_lock_acknowledgment.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether the router should hold off on redirecting to /login because
/// a "session expired" dialog is currently pending acknowledgment.
///
/// Set by [VaultLockManager] the instant it locks the vault due to
/// inactivity; cleared once the dialog has been acknowledged.

@ProviderFor(AwaitingLockAcknowledgment)
final awaitingLockAcknowledgmentProvider =
    AwaitingLockAcknowledgmentProvider._();

/// Whether the router should hold off on redirecting to /login because
/// a "session expired" dialog is currently pending acknowledgment.
///
/// Set by [VaultLockManager] the instant it locks the vault due to
/// inactivity; cleared once the dialog has been acknowledged.
final class AwaitingLockAcknowledgmentProvider
    extends $NotifierProvider<AwaitingLockAcknowledgment, bool> {
  /// Whether the router should hold off on redirecting to /login because
  /// a "session expired" dialog is currently pending acknowledgment.
  ///
  /// Set by [VaultLockManager] the instant it locks the vault due to
  /// inactivity; cleared once the dialog has been acknowledged.
  AwaitingLockAcknowledgmentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'awaitingLockAcknowledgmentProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$awaitingLockAcknowledgmentHash();

  @$internal
  @override
  AwaitingLockAcknowledgment create() => AwaitingLockAcknowledgment();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$awaitingLockAcknowledgmentHash() =>
    r'c995bee115475cb433ed100e1ba32e6d60282dd3';

/// Whether the router should hold off on redirecting to /login because
/// a "session expired" dialog is currently pending acknowledgment.
///
/// Set by [VaultLockManager] the instant it locks the vault due to
/// inactivity; cleared once the dialog has been acknowledged.

abstract class _$AwaitingLockAcknowledgment extends $Notifier<bool> {
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
