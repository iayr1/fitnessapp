import 'package:flutter/material.dart';
import 'package:fitness_app/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:fitness_app/features/authentication/presentation/screens/login_screen.dart';

class Routes {
  static const String onboardingScreen = '/onboarding';
  static const String loginScreen = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
