import 'package:flutter_course/core/routing/routes.dart';
import 'package:flutter_course/core/utils/safe_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/features/splash/splash.dart';

class RouteServices {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    safePrint('generateRoute => ${routeSettings.name}');
    safePrint('generateRoute => ${routeSettings.arguments}');

    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) =>  const SplashScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Page Not Found"),
        ),
      );
    });
  }
}
