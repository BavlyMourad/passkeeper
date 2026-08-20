import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/routes/app_router.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/core/providers/mek_notifier.dart';
import 'package:passkeeper/core/security/awaiting_lock_acknowledgment.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/utils/app_utils.dart';
import 'package:passkeeper/core/widgets/custom_button.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vault_lock_manager.g.dart';

// Locks the vault after a period of inactivity, or immediately if the
// app has been backgrounded for longer than vaultTimeout.
// Two independent triggers feed into the same _lockVault call:
//  - No recorded user interaction for vaultTimeout while foregrounded.
//  - The app was backgrounded and, on resume, more than vaultTimeout
//    has elapsed since it was paused. This is a deliberate grace period
//    (eg: brief app-switcher visits shouldn't force a re-login) rather
//    than an immediate wipe on background.
@Riverpod(keepAlive: true)
class VaultLockManager extends _$VaultLockManager {
  static const vaultTimeout = Duration(minutes: 5);

  Timer? _inactivityTimer;
  AppLifecycleListener? _lifecycleListener;

  DateTime? _lastActivityAt;
  DateTime? _backgroundedAt;

  @override
  void build() {
    _lifecycleListener = AppLifecycleListener(
      onPause: _handlePause,
      onResume: _handleResume,
    );

    ref.listen<Uint8List?>(mekProvider, (_, mek) {
      mek != null ? _startTracking() : _stopTracking();
    });

    ref.onDispose(() {
      _inactivityTimer?.cancel();
      _lifecycleListener?.dispose();
    });

    if (ref.read(mekProvider) != null) {
      _startTracking();
    }
  }

  // Call on any meaningful user interaction (tap, scroll, keystroke)
  // while the vault is unlocked. Resets the inactivity window.
  void recordActivity() {
    if (!_isUnlocked || _backgroundedAt != null) {
      return;
    }

    _lastActivityAt = DateTime.now();
    _scheduleInactivityTimer();
  }

  bool get _isUnlocked => ref.read(mekProvider) != null;

  // Tracking Lifecycle
  void _startTracking() {
    _lastActivityAt = DateTime.now();
    _backgroundedAt = null;
    _scheduleInactivityTimer();
  }

  void _stopTracking() {
    _inactivityTimer?.cancel();
    _inactivityTimer = null;
    _lastActivityAt = null;
    _backgroundedAt = null;
  }

  // App lifecycle
  void _handlePause() {
    if (!_isUnlocked) {
      return;
    }

    // Stop the foreground inactivity clock; backgrounding has its own
    // timeout check on resume instead of an active Timer, since Timers
    // aren't guaranteed to fire while the app is suspended.
    _inactivityTimer?.cancel();
    _inactivityTimer = null;

    _backgroundedAt = DateTime.now();
  }

  void _handleResume() {
    final backgroundedAt = _backgroundedAt;
    _backgroundedAt = null;

    if (backgroundedAt == null || !_isUnlocked) {
      return;
    }

    final backgroundedDuration = DateTime.now().difference(backgroundedAt);

    if (backgroundedDuration >= vaultTimeout) {
      _lockVault();
    } else {
      // Returning within the grace period counts as activity.
      recordActivity();
    }
  }

  // Inactivity timer
  void _scheduleInactivityTimer() {
    _inactivityTimer?.cancel();

    final lastActivityAt = _lastActivityAt;

    if (lastActivityAt == null) {
      return;
    }

    final remaining = vaultTimeout - DateTime.now().difference(lastActivityAt);

    if (remaining <= Duration.zero) {
      _lockVault();
      return;
    }

    _inactivityTimer = Timer(remaining, _lockVault);
  }

  // Locking
  void _lockVault() {
    _stopTracking();

    ref.read(awaitingLockAcknowledgmentProvider.notifier).set();
    ref.read(mekProvider.notifier).clearMek();

    unawaited(_showSessionExpiredDialog());
  }

  Future<void> _showSessionExpiredDialog() async {
    final context = rootNavigatorKey.currentContext;

    if (context == null || !context.mounted) {
      // No UI available to show the dialog on — fall back to a silent
      // redirect rather than leaving the user stuck with no way to
      // acknowledge and unblock navigation.
      ref.read(awaitingLockAcknowledgmentProvider.notifier).consume();
      return;
    }

    final l10n = AppLocalizations.of(context)!;

    await AppUtils.showAppDialog<void>(
      context: context,
      barrierDismissible: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.sessionExpiredTitle,
            style: AppStyles.titleLargeSemiBold(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12.0),
          Text(
            l10n.sessionExpiredMessage,
            style: AppStyles.bodyRegular(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24.0),
          CustomButton(
            title: l10n.sessionExpiredButtonLabel,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );

    if (!ref.mounted) return;

    ref.read(awaitingLockAcknowledgmentProvider.notifier).consume();

    final navContext = rootNavigatorKey.currentContext;

    if (navContext != null && navContext.mounted) {
      navContext.go(AppRoutes.login);
    }
  }
}
