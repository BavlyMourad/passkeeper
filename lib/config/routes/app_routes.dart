import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/routes/app_shell.dart';
import 'package:passkeeper/features/auth/presentation/screens/login_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/favourites_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/passwords_screen.dart';
import 'package:passkeeper/features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const splash = '/';
  static const login = '/login';
  static const passwords = '/passwords';
  static const favourites = '/favourites';

  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),

      GoRoute(path: login, builder: (context, state) => const LoginScreen()),

      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(path: passwords, builder: (_, __) => const PasswordsScreen()),

          GoRoute(
            path: favourites,
            builder: (_, __) => const FavouritesScreen(),
          ),
        ],
      ),
    ],
  );
}
