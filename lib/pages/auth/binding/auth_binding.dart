import 'package:flutter_firebase_chating_app/pages/auth/controller/register_controller.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../provider/auth_provider.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => AuthProvider());
    Get.lazyPut(() => RegisterController());
  }
}
