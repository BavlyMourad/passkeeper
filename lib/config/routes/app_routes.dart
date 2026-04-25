import 'package:go_router/go_router.dart';
import 'package:passkeeper/features/auth/screens/login_screen.dart';
import 'package:passkeeper/features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    ],
  );
}
