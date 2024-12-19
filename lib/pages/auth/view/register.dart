import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/text_form_field_widget.dart';
import '../controller/register_controller.dart';
import 'login.dart';

class Register extends StatelessWidget {
  static const route = '/register';
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
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
                  const Text('Let\'s create an account for you'),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: controller.emailController,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: controller.passwordController,
                    labelText: 'Password',
                  ),
                  const SizedBox(height: 20),
                  MyTextField(
                    controller: controller.passwordController,
                    labelText: 'Confirm Password',
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sign Up'),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Login.route);
                      },
                      child: const Text('Login'))
                ],
              ),
            ),
          ),
        ));
  }
}
