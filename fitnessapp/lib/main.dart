import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/utils/routes.dart';
import 'core/utils/app_themes.dart';
import 'core/utils/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: AppThemes.lightTheme,  // Defined in core/utils/app_themes.dart
      darkTheme: AppThemes.darkTheme,
      onGenerateRoute: Routes.generateRoute,  // Routes defined in core/utils/routes.dart
      navigatorKey: NavigationService.navigatorKey,  // For Navigation
      initialRoute: Routes.onboardingScreen,  // Define initial screen
    );
  }
}
