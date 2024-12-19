import 'package:get/get.dart';

import '../pages/auth/binding/auth_binding.dart';
import '../pages/auth/view/login.dart';
import '../pages/auth/view/register.dart';
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
];
