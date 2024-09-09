import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocBuilder<AuthCubit, User?>(
          builder: (context, user) {
            if (user != null) {
              return Center(child: Text('Logged in as ${user.email}'));
            } else {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthCubit>().signInWithGoogle();
                  },
                  child: Text('Sign in with Google'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
