import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chating_app/utils/app_const.dart';
import 'package:get/get.dart';

import '../../../widgets/text_form_field_widget.dart';
import '../controller/chat_controller.dart';

class ChatPage extends GetView<ChatController> {
  static const route = '/chat_page';
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.receverEmail),
          centerTitle: true,
          backgroundColor: Get.theme.colorScheme.secondaryContainer,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            Expanded(child: _buildChatList()),
            _sendMessageWidget(),
          ]),
        ));
  }

  Widget _buildChatList() {
    return StreamBuilder(
      stream: controller.chatPovider.getMessage(
        controller.receverUid,
        controller.authService.getCurrentUser()!.uid,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: snapshot.data!.docs.map<Widget>((message) => _buildMessageItem(message)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot message) {
    Map<String, dynamic> data = message.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderID'] == box.read(Spf.loginUserId);
    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(data['message']),
        ],
      ),
    );
  }

  Widget _sendMessageWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: controller.messageController,
              labelText: 'Type your message here',
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: controller.sendMessage,
              icon: const Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
