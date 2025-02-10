import 'package:flutter_firebase_chating_app/pages/chat/binding/chat_binding.dart';
import 'package:get/get.dart';

import '../pages/auth/binding/auth_binding.dart';
import '../pages/auth/view/login.dart';
import '../pages/auth/view/register.dart';
import '../pages/chat/view/chat_page.dart';
import '../pages/home_page/binding/home_page_binding.dart';
import '../pages/home_page/view/home_page_view.dart';
import '../pages/setting/binding/setting_binding.dart';
import '../pages/setting/view/setting_view.dart';
import '../pages/splash/binding/splash_binding.dart';
import '../pages/splash/view/splash.dart';

List<GetPage> getpages = [
  GetPage(
    name: Splash.route,
    page: () => const Splash(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Login.route,
    page: () => const Login(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: Register.route,
    page: () => const Register(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: HomePage.route,
    page: () => const HomePage(),
    binding: HomePageBinding(),
  ),
  GetPage(
    name: Setting.route,
    page: () => const Setting(),
    binding: SettingBinding(),
  ),
  GetPage(
    name: ChatPage.route,
    page: () => const ChatPage(),
    binding: ChatBinding(),
  ),
];
