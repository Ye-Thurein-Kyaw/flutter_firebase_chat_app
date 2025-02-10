import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_const.dart';
import '../../home_page/view/home_page_view.dart';
import '../provider/auth_service.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final authService = AuthService();

  void login() async {
    Get.showOverlay(
      asyncFunction: () async {
        try {
          formKey.currentState!.validate();
          UserCredential userCredential = await authService.singInWithEmailAndPassword(email: emailController.text, password: passController.text);
          if (userCredential.user != null) {
            box.write(Spf.loginUserId, userCredential.user!.uid);
            Get.offAllNamed(HomePage.route);
          }
        } catch (e) {
          Get.snackbar('Error', e.toString());
        }
      },
      loadingWidget: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
