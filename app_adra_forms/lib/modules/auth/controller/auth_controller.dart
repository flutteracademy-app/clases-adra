import 'dart:developer';

import 'package:app_adra_forms/modules/auth/screens/email_sign_in_ui.dart';
import 'package:app_adra_forms/modules/auth/screens/login_screen.dart';
import 'package:app_adra_forms/modules/home/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rxn<User> firebaseUser = Rxn<User>();

  static AuthController to = Get.find();

  @override
  void onReady() {
    //run every time auth state changes
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);
    super.onReady();
  }

  handleAuthChanged(firebaseUser) async {
    if (firebaseUser == null) {
      Get.offAll(EmailSignInUi());
    } else {
      Get.offAll(const HomeScreen());
    }
  }

  //Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  //Sign out
  Future<void> signOut() {
    return _auth.signOut();
  }

  //Method to hadle user sign in using email and password
  signInWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } catch (e) {
      log('$e');
    }
  }

  //User registration using email and password
  registerWithEmailAndPassword(BuildContext context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((result) async {
        print("Uid: " + result.user!.uid.toString());
        print("Email: " + result.user!.email.toString());
      });
    } on FirebaseAuthException catch (e) {
      log('$e');
    }
  }
}
