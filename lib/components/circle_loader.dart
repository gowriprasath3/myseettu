import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  const Spinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2.0, // adjust the width of the circle
        valueColor: AlwaysStoppedAnimation<Color>(
            Colors.grey), // change the color of the circle
        backgroundColor:
            Colors.grey, // change the background color of the circle
      ),
    );
  }
}
