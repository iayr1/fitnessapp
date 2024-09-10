import 'package:fitnessapp/features/authentication/domain/repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<User?> {
  final AuthRepository _authRepository = AuthRepository();

  AuthCubit() : super(null) {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(user);
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      User? user = await _authRepository.signInWithGoogle();
      emit(user);
    } catch (e) {
      print('Error signing in: $e');
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(null);
  }
}
