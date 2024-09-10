import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/utils/routes.dart';
import 'core/utils/app_themes.dart';
import 'core/utils/navigation_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: Routes.onboardingScreen,
    );
  }
}
