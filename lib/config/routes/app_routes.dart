import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/routes/app_shell.dart';
import 'package:passkeeper/features/auth/presentation/screens/login_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/add_password_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/favourites_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/password_details_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/passwords_screen.dart';
import 'package:passkeeper/features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const splash = '/';
  static const login = '/login';
  static const passwords = '/passwords';
  static const addPassword = '/add_password';
  static const passwordDetails = '/passwords/:id';
  static const favourites = '/favourites';

  static String passwordDetailsPath(String id) => '/passwords/$id';

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
            path: addPassword,
            builder: (context, state) {
              return const AddPasswordScreen();
            },
          ),

          GoRoute(
            path: passwordDetails,
            builder: (context, state) {
              final id = state.pathParameters['id']!;

              return PasswordDetailsScreen(id: id);
            },
          ),

          GoRoute(
            path: favourites,
            builder: (_, __) => const FavouritesScreen(),
          ),
        ],
      ),
    ],
  );
}
