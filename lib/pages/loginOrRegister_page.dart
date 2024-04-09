import 'package:flutter/material.dart';
import 'package:myseettu/pages/login_screen.dart';
import 'package:myseettu/pages/signup_screen.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {

  bool isLoginPage = true;
  togglePage(){
   setState(() {
      isLoginPage = !isLoginPage;
      print( " ======= $isLoginPage ========");
   });
  }
  @override
  Widget build(BuildContext context) {
     if (isLoginPage){
      print("checking loginPage..");
      return  LogInPage(ontap:togglePage,);
     }else{
      print("checking signUpPage..");
      return SignUpPage(ontap:togglePage,);
     }
  }
}