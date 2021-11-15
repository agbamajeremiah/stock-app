import 'package:flutter/material.dart';
import 'package:stock/core/constants/routes.dart';
import 'package:stock/ui/views/auth/presentation/pages/login_screen.dart';
import 'package:stock/ui/views/home/presentation/pages/tab_screen.dart';
import 'package:stock/ui/views/introduction/splash_screen.dart';

/// Generate routes for navigation
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SplashScreen(),
      );
    case Routes.loginView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const LoginScreen(),
      );
    case Routes.tabView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const TabView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, Widget? viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow!,
  );
}
