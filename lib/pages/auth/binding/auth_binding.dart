import 'package:flutter_firebase_chating_app/pages/auth/controller/register_controller.dart';
import 'package:get/get.dart';

import '../provider/auth_service.dart';
import '../controller/login_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterController());
    Get.lazyPut(() => AuthService());
  }
}
