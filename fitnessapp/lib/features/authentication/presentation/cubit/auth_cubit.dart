import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<User?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(null) {
    _auth.authStateChanges().listen((user) {
      emit(user);
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      // Add Google sign-in logic here
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
