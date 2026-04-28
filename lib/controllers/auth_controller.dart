import 'package:get/get.dart';
import 'package:smis_mobile/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  // AuthService instance
  AuthService auth;

  var loading = false.obs;
  var rememberMe = false.obs;
  var message = ''.obs;

  // Constructor
  AuthController(this.auth);

  // Sign in method
  void signin(String email, String password) async {
    loading.value = true;
    try {
      bool isLoggedIn = await auth.signin(email, password);
      if (isLoggedIn) {
        if (rememberMe.value) {
          // Save credentials securely if needed
        }

        // Clear any previous messages
        message.value = '';

        // Navigate to workspace screen
        Get.toNamed('/home-screen');
      }
    } on AuthApiException catch (e) {
      // Get.snackbar('Sign In Error', e.message);
      message.value = e.message;
    } catch (e) {
      Get.snackbar('Sign In Error', e.toString());
      message.value = e.toString();
    } finally {
      loading.value = false;
    }
  }

  // Sign up method
  void signup(String email, String password) async {
    loading.value = true;
    try {
      bool isSignedUp = await auth.signup(email, password);
      if (isSignedUp) {
        Get.snackbar(
          'Sign Up Success',
          'Please check your email for verification link.',
        );
        Get.offAllNamed('/home-screen');
      }
    } on AuthApiException catch (e) {
      Get.snackbar('Sign Up Error', e.message);
    } catch (e) {
      Get.snackbar('Sign Up Error', e.toString());
    } finally {
      loading.value = false;
    }
  }

  // Sign out method
  void signout() async {
    loading.value = true;
    try {
      await auth.signout();
      Get.toNamed('/login-screen');
    } on AuthApiException catch (e) {
      Get.snackbar('Sign Out Error', e.message);
    } catch (e) {
      Get.snackbar('Sign Out Error', e.toString());
    } finally {
      loading.value = false;
    }
  }
}
