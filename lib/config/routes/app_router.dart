import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/config/routes/app_shell.dart';
import 'package:passkeeper/config/routes/router_refresh_notifier.dart';
import 'package:passkeeper/core/providers/mek_notifier.dart';
import 'package:passkeeper/core/screens/not_found_screen.dart';
import 'package:passkeeper/core/security/awaiting_lock_acknowledgment.dart';
import 'package:passkeeper/features/auth/presentation/screens/login_screen.dart';
import 'package:passkeeper/features/categories/presentation/screens/categories_screen.dart';
import 'package:passkeeper/features/categories/presentation/screens/category_details_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/add_password_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/favourites_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/password_details_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/passwords_screen.dart';
import 'package:passkeeper/features/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:passkeeper/features/settings/presentation/screens/settings_screen.dart';
import 'package:passkeeper/features/splash/presentation/controllers/splash_controller.dart';
import 'package:passkeeper/features/splash/presentation/screens/splash_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final refreshNotifier = RouterRefreshNotifier(ref);
  ref.onDispose(refreshNotifier.dispose);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    refreshListenable: refreshNotifier,
    errorBuilder: (context, state) => const NotFoundScreen(),
    redirect: (context, state) {
      final splashState = ref.read(splashControllerProvider);

      if (splashState.isLoading) {
        return null;
      }

      final isUnlocked = ref.read(mekProvider) != null;
      final awaitingAcknowledgment = ref.read(
        awaitingLockAcknowledgmentProvider,
      );
      final location = state.matchedLocation;

      if (location == AppRoutes.splash) {
        return isUnlocked ? AppRoutes.passwords : AppRoutes.login;
      }

      if (!isUnlocked &&
          location != AppRoutes.login &&
          !awaitingAcknowledgment) {
        return AppRoutes.login;
      }

      if (isUnlocked && location == AppRoutes.login) {
        return AppRoutes.passwords;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),

      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.passwords,
            builder: (_, __) => const PasswordsScreen(),
          ),

          GoRoute(
            path: AppRoutes.addPassword,
            builder: (context, state) {
              return const AddPasswordScreen();
            },
          ),

          GoRoute(
            path: AppRoutes.passwordDetails,
            builder: (context, state) {
              final id = state.pathParameters['id']!;

              return PasswordDetailsScreen(id: id);
            },
          ),

          GoRoute(
            path: AppRoutes.favourites,
            builder: (_, __) => const FavouritesScreen(),
          ),

          GoRoute(
            path: AppRoutes.favouritePasswordDetails,
            builder: (context, state) {
              final id = state.pathParameters['id']!;

              return PasswordDetailsScreen(id: id);
            },
          ),

          GoRoute(
            path: AppRoutes.categories,
            builder: (_, __) => const CategoriesScreen(),
          ),

          GoRoute(
            path: AppRoutes.categoryDetails,
            builder: (context, state) {
              final id = state.pathParameters['id']!;

              return CategoryDetailsScreen(id: id);
            },
          ),

          GoRoute(
            path: AppRoutes.categoryPasswordDetails,
            builder: (context, state) {
              final passwordId = state.pathParameters['passwordId']!;

              return PasswordDetailsScreen(id: passwordId);
            },
          ),

          GoRoute(
            path: AppRoutes.settings,
            builder: (_, __) => const SettingsScreen(),
          ),

          GoRoute(
            path: AppRoutes.privacyPolicy,
            builder: (_, __) => const PrivacyPolicyScreen(),
          ),
        ],
      ),
    ],
  );
}
