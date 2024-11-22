import 'package:flutter/material.dart';
import 'package:schedule_management/utils/colors.dart' as widgets;
import 'package:schedule_management/widgets/thumbnail.dart';
import 'screens/homescreen.dart';
import 'screens/schedulescreen.dart';
import 'screens/onboardingscreen.dart';

void main() {
  runApp(const ScheduleManagementApp());
}

class ScheduleManagementApp extends StatelessWidget {
  const ScheduleManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/schedule': (context) => const ScheduleScreen(),
        //widget as onboardingscreen
        '/onboardingscreen': (context) => const Onboardingscreen(),

        // '/login': (context) => const widgets.OnboardingScreen(),
      },
    );
  }
}
