import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/text_form_field_widget.dart';
import '../controller/login_controller.dart';
import 'register.dart';

class Login extends StatelessWidget {
  static const route = '/login';
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Icon(
                    Icons.message,
                    size: 80,
                    color: Colors.grey[800],
                  ),
                  const SizedBox(height: 50),
                  const Text('Welcome back you\'ve been missed'),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: controller.emailController,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: controller.passController,
                    labelText: 'Password',
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Register.route);
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
