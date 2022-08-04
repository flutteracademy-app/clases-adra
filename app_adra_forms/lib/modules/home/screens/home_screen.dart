import 'package:app_adra_forms/modules/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = AuthController.to;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        authController.signOut();
      }),
      body: Center(
        child: Text(authController.firebaseUser.value!.uid.toString()),
      ),
    );
  }
}
