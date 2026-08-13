import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/routes/app_shell.dart';
import 'package:passkeeper/features/auth/presentation/screens/login_screen.dart';
import 'package:passkeeper/features/categories/presentation/screens/categories_screen.dart';
import 'package:passkeeper/features/categories/presentation/screens/category_details_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/add_password_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/favourites_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/password_details_screen.dart';
import 'package:passkeeper/features/passwords/presentation/screens/passwords_screen.dart';
import 'package:passkeeper/features/settings/presentation/screens/privacy_policy_screen.dart';
import 'package:passkeeper/features/settings/presentation/screens/settings_screen.dart';
import 'package:passkeeper/features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const splash = '/';
  static const login = '/login';
  static const passwords = '/passwords';
  static const addPassword = '/add-password';
  static const passwordDetails = '/passwords/:id';
  static const favourites = '/favourites';
  static const favouritePasswordDetails = '/favourites/:id';
  static const categories = '/categories';
  static const categoryDetails = '/categories/:id';
  static const categoryPasswordDetails =
      '/categories/:categoryId/passwords/:passwordId';
  static const settings = '/settings';
  static const privacyPolicy = '/settings/privacy-policy';

  static String passwordDetailsPath(String id) => '/passwords/$id';
  static String favouritePasswordDetailsPath(String id) => '/favourites/$id';
  static String categoryDetailsPath(String id) => '/categories/$id';
  static String categoryPasswordDetailsPath(
    String categoryId,
    String passwordId,
  ) => '/categories/$categoryId/passwords/$passwordId';

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

          GoRoute(
            path: favouritePasswordDetails,
            builder: (context, state) {
              final id = state.pathParameters['id']!;

              return PasswordDetailsScreen(id: id);
            },
          ),

          GoRoute(
            path: categories,
            builder: (_, __) => const CategoriesScreen(),
          ),

          GoRoute(
            path: categoryDetails,
            builder: (context, state) {
              final id = state.pathParameters['id']!;

              return CategoryDetailsScreen(id: id);
            },
          ),

          GoRoute(
            path: categoryPasswordDetails,
            builder: (context, state) {
              final passwordId = state.pathParameters['passwordId']!;

              return PasswordDetailsScreen(id: passwordId);
            },
          ),

          GoRoute(path: settings, builder: (_, __) => const SettingsScreen()),

          GoRoute(
            path: privacyPolicy,
            builder: (_, __) => const PrivacyPolicyScreen(),
          ),
        ],
      ),
    ],
  );
}
