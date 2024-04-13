import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myseettu/pages/home_page.dart';
import 'package:myseettu/pages/home_screen.dart';
import 'package:myseettu/pages/loginOrRegister_page.dart';
import 'package:myseettu/pages/login_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        if(snapshot.hasData){
          print("snaphot has data...");
           return MyHomePage();
        }else{
          print("not logged in...redirecting to loginOrRegisterPage...");
          return const LoginOrRegisterPage();
        }
      },),
    );
  }
}