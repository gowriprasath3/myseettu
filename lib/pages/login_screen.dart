// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myseettu/components/circle_loader.dart';
import 'package:myseettu/components/my_button.dart';
import 'package:myseettu/components/my_textfield.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key, required this.ontap});

  final Function()? ontap;

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  String errorText = "";

  changeState(newMessage) {
    setState(() {
      errorText = newMessage;
    });
  }

  signIn() async {
    showDialog(
        builder: (context) {
          return const Spinner();
        },
        context: context);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        changeState('No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        changeState('Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      } else {
        changeState(e.code);
        print('Authentication error : ${e.code}');
      }
    }
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Image(
                image: AssetImage("assets/my_seettu_logo.PNG"),
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome back! You've been missed!",
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                hintText: "Email",
                obstructText: false,
                controller: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                hintText: "Password",
                obstructText: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      errorText,
                      style: const TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MyButton(
                buttonFunc: signIn,
                buttonName: 'Sign in',
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Image.asset("../assets/google_logo.png")),
                  const SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: Image.asset("../assets/facebook_logo.png"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not a member?",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: widget.ontap,
                    child: const Text(
                      "Register Now",
                      style: TextStyle(color: Colors.blue, fontSize: 14.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
