import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;
  late SharedPreferences sharedPreferences;

  Future<String> registerUser({required String displayName, required String email, required String password}) async{
    String? _errorMessage;
    User? _user;

    try {
      _user = (await auth.createUserWithEmailAndPassword(email: email, password: password)).user;

      _user!.updateDisplayName(displayName);
      _user.sendEmailVerification();
    }on FirebaseAuthException catch (e) {
      if (e.code=='week-password') {
        _errorMessage = 'The password provided is too week';
      }else if (e.code == 'email-already-in-use'){
        _errorMessage = 'The account already exists for that email.';
      }else if(e.code == 'invaild-email'){
        _errorMessage ='The email address is badly formatted.';
      }else {
        _errorMessage = e.message.toString();
      }
      
    }

    if (_errorMessage != null) {
      return _errorMessage;
    }

    return 'Register success!';
  }

  Future<String> singInWithEmail({required String email, required String password,}) async {
    String? _errorMessage;
    User? _user;
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      _user = (await auth.signInWithEmailAndPassword(email: email, password: password)).user;
      sharedPreferences.setBool('isLogin', true);
      sharedPreferences.setString('displayName', _user!.displayName.toString());
      sharedPreferences.setString('email', _user.email.toString());
      sharedPreferences.setBool('isVerified', _user.emailVerified);

    }on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
      _errorMessage = 'No user found with the credential.';
    } else if (e.code == 'wrong-password') {
      _errorMessage = 'The password is wrong.';
    } else if (e.code == 'invalid-email') {
      _errorMessage = 'The email address is badly formatted.';
    } else {
      _errorMessage = e.message.toString();
    }
    }

    if (_errorMessage != null) {
    return _errorMessage;
   }

  return 'Login success!';

  }


 Future<void> signOut() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    await auth.signOut();
  }

}