import 'package:get/get.dart';

import '../controller/setting_controller.dart';
import '../provider/setting_provider.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => SettingProvider());
  }
}
