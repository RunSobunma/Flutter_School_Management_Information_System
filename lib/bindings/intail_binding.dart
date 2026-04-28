import 'package:get/get.dart';
import 'package:smis_mobile/controllers/auth_controller.dart';
import 'package:smis_mobile/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IntailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Supabase.instance.client);
    Get.put(AuthService(Get.find()));
    Get.put(AuthController(Get.find()));
  }
}
