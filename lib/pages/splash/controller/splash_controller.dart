import 'dart:developer';
import 'package:get/get.dart';
import '../../../utils/app_const.dart';
import '../../auth/view/login.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    isLoggedIn();
  }

  isLoggedIn() async {
    String? token = box.read(Spf.token);
    log("token : $token");
    await Future.delayed(const Duration(seconds: 2));
    Get.toNamed(Login.route);
    if (token == null) {
    } else {}
  }
}
