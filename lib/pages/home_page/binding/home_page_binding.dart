import 'package:get/get.dart';

import '../../auth/provider/auth_service.dart';
import '../../chat/provider/chat_provider.dart';
import '../controller/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => ChatProvider());
  }
}
