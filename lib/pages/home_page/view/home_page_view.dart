import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/my_drawer.dart';
import '../../../widgets/user_tile.dart';
import '../../chat/view/chat_page.dart';
import '../controller/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  static const route = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    final controller = Get.find<HomePageController>();
    return StreamBuilder(
      stream: controller.chatProvider.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData)).toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData) {
    if (userData['email'] != controller.authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData['email'],
        onTap: () {
          Get.toNamed(ChatPage.route, parameters: {
            'receverEmail': userData['email'],
            'receverUid': userData['uid'],
          });
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
