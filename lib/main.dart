import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:info_mobile_application/pages/login_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:info_mobile_application/pages/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    DevicePreview(
     builder: (context) => MyApp()
    ), 
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        nextScreen: const LoginPage(),
        splash: Image.asset(
          'assets/images/infologo.png',
          ),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        duration: 3000,
      ),
    );
  }
}
