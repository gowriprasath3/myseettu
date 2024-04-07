import 'package:flutter/material.dart';
import 'package:myseettu/components/my_button.dart';
import 'package:myseettu/components/my_textfield.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
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
                hintText: "Username",
                obstructText: false,
                controller: userNameController,
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
              const Padding(
                padding: EdgeInsets.only(right: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const MyButton(),
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
                  Container(
                      height: 50.0,
                      width: 50.0,
                      child: Image.asset("../assets/google_logo.png")),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                      height: 50.0,
                      width: 50.0,
                      child: Image.asset("../assets/facebook_logo.png"),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
