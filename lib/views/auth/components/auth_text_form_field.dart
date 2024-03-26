import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
        if(value==null||value==''){
          return '未入力';
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text(label)
      ),
      controller: controller,
    );
  }
}