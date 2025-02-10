import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chating_app/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/splash/view/splash.dart';
import 'utils/routes.dart';
import 'utils/theme.dart';

void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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