import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom/utils/utils.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //to get authentication thing in stream
  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

//method for google sign in and data extarction
  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      
      //google sign in method
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;

//data Extarction for Authticated email
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection('users').doc(user.uid).set(
            {
              'username': user.displayName,
              'uid': user.uid,
              'profilePhoto': user.photoURL,
              'mobileno':user.phoneNumber,
            },
          );
        }
        res = true;
      }
    }on FirebaseAuthException catch (e) {
      showSnackbar(context,e.message!);
      res=false;
    }
    return res;
  }
  void signout()async{
    try{
     await _auth.signOut();
    }catch(e){
      print(e);
    }
  }
}
