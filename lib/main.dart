import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woow_social/core/theme/app_theme.dart';
import 'package:woow_social/features/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WoowSocialApp());
}

class WoowSocialApp extends StatelessWidget {
  const WoowSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Woow Social',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      defaultTransition: Transition.fade,
    );
  }
}
