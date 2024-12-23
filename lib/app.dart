import 'package:flutter/material.dart';
import 'package:schedule_management/screens/dashboard.dart';
import 'package:schedule_management/screens/loginscreen.dart';
import 'package:schedule_management/screens/registrationscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:schedule_management/screens/onboardingscreen.dart';
import 'package:schedule_management/screens/homescreen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
      routes: {
        '/homescreen': (context) => HomeScreen(),
        '/registrationscreen': (context) => LoginScreen(),
        '/loginscreen': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
