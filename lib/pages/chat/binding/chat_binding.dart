import 'package:get/get.dart';

import '../../../network/api_service.dart';
import '../../auth/provider/auth_service.dart';
import '../controller/chat_controller.dart';
import '../provider/chat_provider.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => ChatProvider());
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => AuthService());
  }
}
