import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passkeeper/core/providers/mek_notifier.dart';
import 'package:passkeeper/core/security/awaiting_lock_acknowledgment.dart';
import 'package:passkeeper/features/splash/presentation/controllers/splash_controller.dart';

// Notifies GoRouter to re-run redirect whenever the unlocked/locked
// state changes, the initial splash/session check resolves, or a
// pending lock-acknowledgment dialog is resolved/skipped.
class RouterRefreshNotifier extends ChangeNotifier {
  RouterRefreshNotifier(Ref ref) {
    _mekSubscription = ref.listen(mekProvider, (_, __) {
      notifyListeners();
    });

    _splashSubscription = ref.listen(splashControllerProvider, (_, __) {
      notifyListeners();
    });

    _awaitingAcknowledgmentSubscription = ref.listen(
      awaitingLockAcknowledgmentProvider,
      (_, __) {
        notifyListeners();
      },
    );
  }

  late final ProviderSubscription _mekSubscription;
  late final ProviderSubscription _splashSubscription;
  late final ProviderSubscription _awaitingAcknowledgmentSubscription;

  @override
  void dispose() {
    _mekSubscription.close();
    _splashSubscription.close();
    _awaitingAcknowledgmentSubscription.close();
    super.dispose();
  }
}
