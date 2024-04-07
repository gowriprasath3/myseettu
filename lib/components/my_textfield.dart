import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obstructText,
      required this.controller});

  final String hintText;
  final bool obstructText;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextFormField(
        controller: controller,
        // cursorHeight: 20.0,
        // hintText: 'Enter a search term',
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 229, 226, 226),
            ),
          ),
          fillColor: const Color.fromARGB(255, 229, 226, 226),
          filled: true,
        ),
        style: const TextStyle(fontSize: 16 ),
        obscureText: obstructText,
      ),
    );
  }
}
