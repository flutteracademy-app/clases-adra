import 'package:app_adra_forms/firebase_options.dart';
import 'package:app_adra_forms/modules/auth/controller/auth_controller.dart';
import 'package:app_adra_forms/modules/auth/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put<AuthController>(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Material App',
      home: SplashScreen(),
    );
  }
}
