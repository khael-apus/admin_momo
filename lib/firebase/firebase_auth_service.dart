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

  // Future<void> registerCredential(
  //     String email,
  //     String password,
  //     final Function(UserCredential) onCreate,
  //     final Function(User?) onCreated,
  //     final Function(String uid) onSuccess) async {
  //   try {
  //     final userCredential = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     onCreate(userCredential);
  //     final user = userCredential.user;
  //     onCreated(user);
  //     if (user != null) {
  //     onSuccess(user.uid);
  //   }
  // } catch (e) {
  //   print("Error during user creation: $e");
  // }
  // }

  Future<UserCredential?> verifyCredential(
      String email, String password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } catch (e) {
      print('Error loggin in user');
      return null;
    }
  }
}
