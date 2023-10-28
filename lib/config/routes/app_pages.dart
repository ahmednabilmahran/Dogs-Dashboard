import 'package:dogs_dashboard/config/routes/app_routes.dart';
import 'package:dogs_dashboard/core/utils/app_strings.dart';
import 'package:dogs_dashboard/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:dogs_dashboard/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

/// A class that provides a centralized location for app-wide route settings.
class AppRoutes {
  /// This method is called when the app needs to generate a route.
  /// [routeSettings] contains the settings for the route to generate.
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // Route for the initial (splash) screen.
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
          settings: const RouteSettings(name: Routes.initialRoute),
        );

      // Route for the AppLayout screen, with a fade transition.
      case Routes.dashboardRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: const DashboardScreen(),
            );
          },
          settings: const RouteSettings(name: Routes.dashboardRoute),
          transitionDuration: Duration.zero,
        );

      // Default case for undefined routes.
      default:
        return undefinedRoute();
    }
  }

  /// This method is called when an undefined route is navigated to.
  /// Returns a scaffold displaying a "no route found" message.
  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
      settings: const RouteSettings(name: 'undefinedRoute'),
    );
  }
}
