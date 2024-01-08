import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> registerUser(String name, String email, String password) async {
    try {
      // Create a new user with email and password
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the newly created user
      User? user = authResult.user;

      // Additional: Update user display name
      if (user != null) {
        await user.updateDisplayName(name);
      }
    } on FirebaseAuthException catch (e) {
      // Handle registration errors, e.g., invalid email, weak password, etc.
      print('Error during user registration: $e');
      // You might want to throw an exception or return an error message.
    }
  }
  Future<void> signInUser(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOutUser() async {
    await _auth.signOut();
  }
}
