import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/provider/auth_service.dart';
import '../provider/chat_provider.dart';

class ChatController extends GetxController {
  final String receverEmail = Get.parameters['receverEmail'] ?? '';
  final String receverUid = Get.parameters['receverUid'] ?? '';
  final TextEditingController messageController = TextEditingController();
  final ChatProvider chatPovider = ChatProvider();
  final AuthService authService = AuthService();


  void sendMessage() async{
    if(messageController.text.isNotEmpty){
      await chatPovider.sendMessage(message: messageController.text, receverID: receverUid);
      messageController.clear();
    }
  }
}
