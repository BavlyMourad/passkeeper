import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:passkeeper/config/l10n/app_localizations.dart';
import 'package:passkeeper/config/routes/app_routes.dart';
import 'package:passkeeper/config/theme/app_colors.dart';
import 'package:passkeeper/core/constants/app_enums.dart';
import 'package:passkeeper/core/constants/icon_paths.dart';
import 'package:passkeeper/core/extensions/app_build_context.dart';
import 'package:passkeeper/core/extensions/app_color_scheme.dart';
import 'package:passkeeper/core/styles/app_styles.dart';
import 'package:passkeeper/core/widgets/app_icon.dart';
import 'package:passkeeper/core/widgets/gradient_background.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  int _locationToIndex(String location) {
    if (location.startsWith(AppRoutes.passwords)) return 0;
    if (location.startsWith(AppRoutes.favourites)) return 1;
    if (location.startsWith(AppRoutes.categories)) return 2;
    if (location.startsWith(AppRoutes.settings)) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = GoRouterState.of(context).uri.toString();
    final selectedIndex = _locationToIndex(location);

    return GradientBackground(
      begin: context.isDarkTheme ? Alignment.bottomRight : Alignment.centerLeft,
      end: context.isDarkTheme ? Alignment.topLeft : Alignment.topRight,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: child,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.10),
                blurRadius: 12.0,
                offset: const Offset(0.0, -4.0),
              ),
            ],
          ),
          child: NavigationBar(
            height: context.isMobile ? 70.0 : 100.0,
            selectedIndex: selectedIndex,
            indicatorColor: Theme.of(context).colorScheme.navBarIndicator,
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return AppStyles.captionSemiBold(
                  context,
                ).copyWith(color: Theme.of(context).colorScheme.onSecondary);
              }
              return AppStyles.captionMedium(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.onSecondary);
            }),
            onDestinationSelected: (index) {
              final routes = [
                AppRoutes.passwords,
                AppRoutes.favourites,
                AppRoutes.categories,
                AppRoutes.settings,
              ];

              final route = routes[index];

              context.go(route);
            },
            destinations: [
              NavigationDestination(
                label: AppLocalizations.of(context)!.passwords,
                icon: AppIcon(
                  path: IconPaths.home,
                  size: IconSize.medium,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              NavigationDestination(
                label: AppLocalizations.of(context)!.favourites,
                icon: AppIcon(
                  path: IconPaths.favouriteOutline,
                  size: IconSize.medium,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              NavigationDestination(
                label: AppLocalizations.of(context)!.categories,
                icon: AppIcon(
                  path: IconPaths.categories1,
                  size: IconSize.medium,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              NavigationDestination(
                label: AppLocalizations.of(context)!.settings,
                icon: AppIcon(
                  path: IconPaths.settings,
                  size: IconSize.medium,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
