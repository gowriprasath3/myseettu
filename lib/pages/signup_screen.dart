import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myseettu/components/circle_loader.dart';
import 'package:myseettu/components/my_button.dart';
import 'package:myseettu/components/my_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.ontap});

  final Function()? ontap;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String errorText = "";

  void checkPassword() async {
    showDialog(
        builder: (context) {
          return const Spinner();
        },
        context: context);
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        // await FirebaseAuth.instance.signInWithEmailAndPassword(
        //     email: emailController.text, password: passwordController.text);
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorText = e.code;
        });
      }
    } else {
      setState(() {
        errorText = "password doesn't match";
      });
    }
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                  "Welcome! We are happy onboarding you",
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  hintText: "Username",
                  obstructText: false,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 3,
                ),
                MyTextField(
                  hintText: "Password",
                  obstructText: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 3,
                ),
                MyTextField(
                    hintText: " Confirm Password",
                    obstructText: true,
                    controller: confirmPasswordController),
                const SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        errorText,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                MyButton(
                  buttonFunc: checkPassword,
                  buttonName: 'Sign up',
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
                      "Already having an account?",
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: const Text(
                        "Login Now",
                        style: TextStyle(color: Colors.blue, fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
