import 'package:go_router/go_router.dart';
import 'package:passkeeper/features/auth/presentation/screens/login_screen.dart';
import 'package:passkeeper/features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const splash = '/';
  static const login = '/login';

  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: login, builder: (context, state) => const LoginScreen()),
    ],
  );
}
