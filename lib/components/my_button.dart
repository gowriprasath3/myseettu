import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.buttonFunc, required this.buttonName});
  final String buttonName;
  final buttonFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunc,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          shape: BoxShape.rectangle,
          color: Colors.black,
        ),
        child: Text(
          buttonName,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}
