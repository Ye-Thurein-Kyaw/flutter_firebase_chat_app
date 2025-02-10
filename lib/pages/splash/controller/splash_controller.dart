import 'dart:developer';
import 'package:get/get.dart';
import '../../../utils/app_const.dart';
import '../../auth/view/login.dart';
import '../../home_page/view/home_page_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    isLoggedIn();
  }

  isLoggedIn() async {
    String? loginUserID = box.read(Spf.loginUserId);
    log("loginUserId : $loginUserID");
    await Future.delayed(const Duration(seconds: 2));
    if (loginUserID == null) {
      Get.offAllNamed(Login.route);
    } else {
      Get.offAllNamed(HomePage.route);
    }
  }
}
