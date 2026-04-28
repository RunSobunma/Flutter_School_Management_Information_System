import 'package:get/get.dart';
import 'package:smis_mobile/services/auth_service.dart';

class SplashController extends GetxController {
  AuthService auth;
  SplashController(this.auth);

  @override
  onInit() {
    _checkAuthStatus();
    super.onInit();
  }

  void _checkAuthStatus() async {
    await Future.delayed(const Duration(seconds: 3));
    if (auth.currentUser != null) {
      Get.offAllNamed('/home-screen');
    } else {
      Get.offAllNamed('/login-screen');
    }
  }
}
