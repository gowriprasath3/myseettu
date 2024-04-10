import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myseettu/components/circle_loader.dart';
import 'package:myseettu/components/my_button.dart';
import 'package:myseettu/components/my_textfield.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final emailTextController = TextEditingController();
  var errText = "";

  void resetPassword() async {
    showDialog(
        builder: (context) {
          return const Spinner();
        },
        context: context);
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTextController.text.trim());
      Navigator.of(context, rootNavigator: true).pop();
      const AlertDialog(actions: [Text("reset link sent successfully...")]);
    } on FirebaseAuthException catch (e) {
      Navigator.of(context, rootNavigator: true).pop();
      print("reset error:" + e.code);
      AlertDialog(
        actions: [
          Text(
            e.code,
            style: const TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
        ],
        icon: const Icon(Icons.warning_rounded),
        title: const Text(
          "Warning",
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text(
                "Enter your email. we'll send you the password reset link.",
                style: TextStyle(color: Colors.grey, fontSize: 16.0)),
            const SizedBox(
              height: 10.0,
            ),
            MyTextField(
                hintText: "email",
                obstructText: false,
                controller: emailTextController),
            MyButton(buttonFunc: resetPassword, buttonName: "Reset")
          ],
        ),
      ),
    );
  }
}
