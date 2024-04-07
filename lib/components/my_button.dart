import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        shape: BoxShape.rectangle,
        color: Colors.black,
      ),
      child: const Text(
        "Sign in",
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    );
  }
}
