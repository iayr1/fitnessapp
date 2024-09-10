import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitnessapp/features/authentication/presentation/cubit/auth_cubit.dart';
import '../../../../core/network/fitbit_auth_service.dart';

class LoginScreen extends StatelessWidget {
  final FitbitAuthService _fitbitAuthService = FitbitAuthService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: BlocProvider(
          create: (_) => AuthCubit(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login to your account'),
              const SizedBox(height: 20),
              // Google Sign-In Button
              ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().signInWithGoogle();
                },
                child: const Text('Sign in with Google'),
              ),
              const SizedBox(height: 20),
              // Fitbit Sign-In Button
              ElevatedButton(
                onPressed: () async {
                  final accessToken = await _fitbitAuthService.authenticate();
                  if (accessToken != null) {
                    // Use the access token to fetch data
                    print('Fitbit Access Token: $accessToken');
                    // TODO: Navigate to the next screen or fetch Fitbit data
                  } else {
                    print('Fitbit authentication failed');
                  }
                },
                child: const Text('Sign in with Fitbit'),
              ),
              const SizedBox(height: 20),
              // Forgot Password
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot_password');
                },
                child: const Text('Forgot Password?'),
              ),
              const SizedBox(height: 20),
              // Navigate to Signup
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Don\'t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
