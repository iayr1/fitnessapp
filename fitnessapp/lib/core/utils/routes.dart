import 'package:fitnessapp/features/authentication/presentation/screens/login_screen.dart';
import 'package:fitnessapp/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String onboardingScreen = '/onboarding';
  static const String loginScreen = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('No route defined'))));
    }
  }
}
