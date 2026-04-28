import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends GetxService {
  // Supabase client instance
  SupabaseClient supabase;

  // Current user observable
  User? currentUser;

  // Constructor
  AuthService(this.supabase);

  @override
  void onInit() {
    currentUser = supabase.auth.currentUser;
    supabase.auth.onAuthStateChange.listen((event) {
      currentUser = event.session?.user;
    });
    super.onInit();
  }

  // Sign in method
  Future<bool> signin(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  // Sign up method
  Future<bool> signup(String email, String password) async {
    try {
      await supabase.auth.signUp(email: email, password: password);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  // Sign out method
  Future<void> signout() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
