import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.label,
  });
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value == '') {
          return '未入力ですよ';
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text(label),
      ),
      controller: controller,
    );
  }
}