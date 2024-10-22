import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerCredential(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  Future<void> verifyCredential(String email, String password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print('Error loggin in user');
    }
  }
}
