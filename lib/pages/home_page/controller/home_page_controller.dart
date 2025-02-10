import 'package:flutter_firebase_chating_app/pages/auth/provider/auth_service.dart';
import 'package:flutter_firebase_chating_app/pages/chat/provider/chat_provider.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final ChatProvider chatProvider = Get.find<ChatProvider>();
  final AuthService authService = Get.find<AuthService>();


}
