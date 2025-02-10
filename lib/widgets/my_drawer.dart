import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/auth/provider/auth_service.dart';
import '../pages/auth/view/login.dart';
import '../pages/home_page/view/home_page_view.dart';
import '../pages/setting/view/setting_view.dart';
import '../utils/app_const.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Get.theme.colorScheme.onPrimary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Icon(
                      Icons.message,
                      color: Get.theme.colorScheme.secondary,
                      size: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: const Text('H O M E'),
                    leading: const Icon(Icons.home),
                    onTap: () {
                      Get.offAndToNamed(HomePage.route);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    title: const Text('S E T T I N G S'),
                    leading: const Icon(Icons.settings),
                    onTap: () {
                      Get.toNamed(Setting.route);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: ListTile(
                title: const Text('L O G O U T'),
                leading: const Icon(Icons.logout),
                onTap: () async {
                  final authService = AuthService();
                  await authService.signOut();
                  box.remove(Spf.loginUserId);
                  Get.offAllNamed(Login.route);
                },
              ),
            ),
          ],
        ));
  }
}
