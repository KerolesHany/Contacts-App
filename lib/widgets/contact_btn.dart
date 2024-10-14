import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  String text;
  Color color;
  VoidCallback onPressed;
  DefaultButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) 
  {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
