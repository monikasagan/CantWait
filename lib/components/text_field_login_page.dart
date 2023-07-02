import 'package:flutter/material.dart';

class TextFieldLoginPage extends StatelessWidget {
  final dynamic controller;
  final String hintText;
  final bool obscureText;

  const TextFieldLoginPage(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade800),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: Colors.grey.shade800,
            filled: true,
            hintText: hintText),
      ),
    );
  }
}
