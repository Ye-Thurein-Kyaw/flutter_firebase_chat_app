import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/setting_controller.dart';

class Setting extends GetView<SettingController> {
  static const route = '/setting';
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
    );
  }
}
