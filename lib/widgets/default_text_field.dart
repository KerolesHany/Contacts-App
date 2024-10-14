import 'package:flutter/material.dart';

class DefualtTextField extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextEditingController controller;
  const DefualtTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Please Enter Your $text";
          }

          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: icon,
          hintText: "Enter Your $text",
          hintStyle: const TextStyle(color: Colors.black),

          //! enabledBorder
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              )),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(32),
            ),
          ),
          //! focusedBorder
        ));
  }
}
