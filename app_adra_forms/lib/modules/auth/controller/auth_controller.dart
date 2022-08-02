import 'package:app_adra_forms/modules/auth/screens/login_screen.dart';
import 'package:app_adra_forms/modules/home/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      Get.offAll(const LoginScreen());
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
}
