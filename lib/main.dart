import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/splash/view/splash.dart';
import 'utils/routes.dart';
import 'utils/theme.dart';

void main() {
  Get.put(const MaterialTheme(TextTheme()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: MaterialTheme.constant.light(),
      darkTheme: MaterialTheme.constant.dark(),
      highContrastDarkTheme: MaterialTheme.constant.darkHighContrast(),
      highContrastTheme: MaterialTheme.constant.lightHighContrast(),
      getPages: getpages,
      initialRoute: Splash.route,
    );
  }
}