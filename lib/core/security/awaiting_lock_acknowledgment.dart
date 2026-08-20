import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'awaiting_lock_acknowledgment.g.dart';

/// Whether the router should hold off on redirecting to /login because
/// a "session expired" dialog is currently pending acknowledgment.
///
/// Set by [VaultLockManager] the instant it locks the vault due to
/// inactivity; cleared once the dialog has been acknowledged.
@Riverpod(keepAlive: true)
class AwaitingLockAcknowledgment extends _$AwaitingLockAcknowledgment {
  @override
  bool build() => false;

  void set() => state = true;

  void consume() => state = false;
}
