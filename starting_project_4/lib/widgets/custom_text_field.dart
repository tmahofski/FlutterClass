import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final Function(String)? onChange;
  const CustomTextField({required this.hintText, required this.obscureText, this.controller, this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(100),
          ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodySmall,
        ),
        textAlign: TextAlign.center,
        obscureText: obscureText,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
