import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register user and save data in Firestore
  Future<UserCredential> registerCredential(
      String email, String password) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // If user is successfully created, store their information in Firestore
      User? user = userCredential.user;
      if (user != null) {
        await _firestore.collection('Consumer').doc(user.uid).set({
          'email': email,
          'uid': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      // Return the UserCredential
      return userCredential; // Ensure you return this
    } catch (e) {
      print("Error during registration: $e");
      rethrow; // Re-throw the exception to handle it in the calling code
    }
  }

  // Verify user credentials
  Future<UserCredential?> verifyCredential(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      print('Error logging in user: $e');
      return null;
    }
  }
}
