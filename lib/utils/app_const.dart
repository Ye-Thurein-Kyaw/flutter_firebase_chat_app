import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class Spf {
  static const loginUserId = "loginUserID";
  static const saveLogin = "saveLogin";
  static const email = "email";
  static const password = 'password';
  static const isCompleteOnboarding = 'isCompleteOnboarding';
  static const isCompleteAuth = 'isCompleteAuth';
}

PreferredSizeWidget cardAppBar(String titleText) {
  return AppBar(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    foregroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    title: Text(
      titleText,
      style: Get.textTheme.headlineSmall!
          .copyWith(color: Get.theme.colorScheme.onPrimary),
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        size: 16,
      ),
      color: Get.theme.colorScheme.onPrimary,
      onPressed: () => Get.back(),
    ),
    actions: [
      Icon(
        Icons.question_mark,
        size: 16,
        color: Get.theme.colorScheme.onPrimary,
      ),
    ],
    centerTitle: true,
  );
}
