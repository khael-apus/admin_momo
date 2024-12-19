import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Declare globalUID (Make sure this is in your main.dart or an appropriate global scope)
String? globalUID;

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

        // Set the global UID after successful registration
        globalUID = user.uid;
      }

      return userCredential;
    } catch (e) {
      print("Error during registration: $e");
      rethrow;
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

      // Set the global UID after successful login
      if (userCredential.user != null) {
        globalUID = userCredential.user!.uid;
      }

      return userCredential;
    } catch (e) {
      print('Error logging in user: $e');
      return null;
    }
  }
}
