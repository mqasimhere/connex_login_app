import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // Return null if sign in is successful
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message if sign in fails
    }
  }

  Future<String?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Return null if sign up is successful
    } on FirebaseAuthException catch (e) {
      return e.message; // Return error message if sign up fails
    }
  }

  Future<void> signOut() async {
    await _auth.signOut(); // Sign out the user
  }

  // Get the current user
  User? getCurrentUser() {
    return _auth.currentUser; // Return the current user
  }
}
