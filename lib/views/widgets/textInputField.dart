// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextInpurField extends StatelessWidget {
  // const TextInpurField({Key? key}) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final icon;
  bool isobsecure;

  TextInpurField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.isobsecure = false,
    required this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
      obscureText: isobsecure,
    );
  }
}
