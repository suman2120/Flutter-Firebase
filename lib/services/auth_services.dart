import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signIn(String email, String password)async{
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
  }


   Future<void> signUp(String email, String password)async{
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
  }


  Future<void> signOut() async{
    await _firebaseAuth.signOut();
  }

Future<void> logininwithgoogle() async{
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  AuthCredential myCredential =  GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  UserCredential user = await FirebaseAuth.instance.signInWithCredential(myCredential);
 // debugPrint(user.user?.displayName);
}


  // signIn(String email, String password) async {
  //   UserCredential userCredential = await _firebaseAuth
  //       .signInWithEmailAndPassword(email: email, password: password);
  // }
}
