import 'package:bmi_calculator_23/frontend/views/screens/home_screen.dart';
import 'package:bmi_calculator_23/frontend/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';

enum Routes {
  home,
  settings,
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (Routes.values.firstWhere((e) => e.toString() == 'Routes.${settings.name}')) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      default:
        return null;
    }
  }
}
