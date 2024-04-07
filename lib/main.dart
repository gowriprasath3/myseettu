import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:myseettu/pages/login_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 14, 64, 104)),
        useMaterial3: true,
      ),
      home: const Splash()
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key, });

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/my_seettu_logo.PNG"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: LogInPage(),
          duration: const Duration(seconds: 3),
        );
  }
}

