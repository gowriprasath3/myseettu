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
      print("reset link sent");

      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (context){
        return  AlertDialog(content: Text("Password reset link sent to ${emailTextController.text.trim()}"),);
      });
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      Navigator.of(context, rootNavigator: true).pop();
      print("reset error:" + e.code);
      showDialog(context: context, builder: (context){
        return AlertDialog(
        content: Text(
            e.code,
            style: const TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
        icon: const Icon(Icons.warning_rounded),
        title: const Text(
          "Warning",
          style: TextStyle(color: Colors.grey, fontSize: 18.0),
        ),
      );
      });
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
                hintText: "Email",
                obstructText: false,
                controller: emailTextController),
            MyButton(buttonFunc: resetPassword, buttonName: "Reset")
          ],
        ),
      ),
    );
  }
}
