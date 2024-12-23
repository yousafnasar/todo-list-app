import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:schedule_management/app.dart';
import 'package:schedule_management/controllers/signup_controller.dart';
import 'package:schedule_management/firebase_options.dart';
import 'package:schedule_management/repository/authentication_repository.dart';
// import 'package:schedule_management/screens/dashboard.dart';
// import 'package:schedule_management/screens/homescreen.dart';
// import 'package:schedule_management/screens/registrationscreen.dart';
// import 'package:schedule_management/screens/loginscreen.dart';
import 'package:schedule_management/utils/navigation_provider.dart';

Future<void> main() async {
  final WidgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  Get.put(SignupController());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      // child: const ScheduleManagementApp(),
      child: const App(),
    ),
  );
}

// class ScheduleManagementApp extends StatelessWidget {
//   const ScheduleManagementApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/homescreen',
//       routes: {
//         '/homescreen': (context) => HomeScreen(),
//         '/loginscreen': (context) => LoginScreen(),
//         '/registrationscreen': (context) => Registrationscreen(),
//         '/dashboard': (context) => DashboardScreen()
//       },
//     );
//   }
// }
