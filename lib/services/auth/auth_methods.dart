import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {

  final auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? getCurrentUser(){
    return auth.currentUser;
  }

  Future<UserCredential> signIn(String email, String password) async {
    UserCredential userCredential=  await auth.signInWithEmailAndPassword(
      email: email, password: password
      );

       _firestore.collection('Users').doc(userCredential.user!.uid).set(
      {
        'email': email,
        'uid': userCredential.user!.uid,
      }
    );

      return userCredential;
  }

  // Example method for signing up
  Future<UserCredential> signUp(String email, String password) async {
    UserCredential userCredential= await auth.createUserWithEmailAndPassword(
    email: email, 
    password: password
    );

    _firestore.collection('Users').doc(userCredential.user!.uid).set(
      {
        'email': email,
        'uid': userCredential.user!.uid,
      }
    );

    return userCredential;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}