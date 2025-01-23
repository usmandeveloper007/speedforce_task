import 'package:get/get.dart';
import 'package:hiring_task/app/bindings/auth_binding.dart';
import 'package:hiring_task/app/view/login/login_screen.dart';
import 'package:hiring_task/app/view/signup/signup_screen.dart';
import 'package:hiring_task/app/view/splash/splash_screen.dart';

import 'route_names.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RouteNames.logInScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RouteNames.signUpScreen,
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
  ];
}
