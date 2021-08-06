import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/features/home/presentation/home_screen.dart';

class AppRouter {
  static const String initialRoute = '/';

  const AppRouter._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    log.debug('Navigate to ${settings.name} (App router)');

    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case AppRouter.initialRoute:
            return const HomeScreen();

          default:
            log.error("Route ${settings.name} not found!");
            throw Exception("Route ${settings.name} not found!");
        }
      },
    );
  }
}
