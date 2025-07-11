import 'package:get/get.dart';
import 'package:woow_social/features/home/home_screen.dart';
import 'package:woow_social/features/main_home/main_home.dart';
import 'package:woow_social/features/onBoard/login_check.dart';
import 'package:woow_social/features/onBoard/onboard_user.dart';
import 'package:woow_social/features/splash/splash_screen.dart';
import 'package:woow_social/routes/route_names.dart';

allPages() {
  return [
    GetPage(name: RouteNames.splashScreen, page: () => const SplashScreen()),
    GetPage(name: RouteNames.onBoardUser, page: () => OnBoardUser()),
    GetPage(name: RouteNames.loginCheck, page: () => const LoginCheck()),
    GetPage(name: RouteNames.homeScreen, page: () => const HomeScreen()),
    GetPage(name: RouteNames.mainHome, page: () => MainHome()),
  ];
}
