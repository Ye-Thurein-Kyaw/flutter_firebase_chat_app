import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_const.dart';
import '../../home_page/view/home_page_view.dart';
import '../provider/auth_service.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authService = AuthService();

  void register() async {
    Get.showOverlay(
      asyncFunction: () async {
        try {
          formKey.currentState!.validate();
          if (passwordController.text != confirmPasswordController.text) {
            throw Exception('Passwords do not match');
          }
          UserCredential userCredential = await authService.registerWithEmailAndPassword(email: emailController.text, password: passwordController.text);
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
