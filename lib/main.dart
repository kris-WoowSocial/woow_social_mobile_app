import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woow_social/core/theme/app_theme.dart';
import 'package:woow_social/routes/register_routes.dart';
import 'package:woow_social/routes/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDepedencies();

  runApp(const WoowSocialApp());
}

final serviceLocatorInstance = GetIt.instance;

Future setupDepedencies() async {
  if (!serviceLocatorInstance.isRegistered<SharedPreferences>()) {
    final sharedPreferences = await SharedPreferences.getInstance();
    serviceLocatorInstance
        .registerSingleton<SharedPreferences>(sharedPreferences);
  }
}

class WoowSocialApp extends StatelessWidget {
  const WoowSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Woow Social',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: RouteNames.splashScreen,
      getPages: allPages(),
      defaultTransition: Transition.fade,
    );
  }
}
