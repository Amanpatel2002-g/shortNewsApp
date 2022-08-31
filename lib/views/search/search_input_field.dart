import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  // const TextInputField({Key? key}) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  bool isobsecure;
  final Function functiontobecalled;
  SearchInputField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.isobsecure = false,
    required this.icon,
    required this.functiontobecalled,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: GestureDetector(
            onTap: () => functiontobecalled(),
            child: Container(
                padding: const EdgeInsets.only(right: 25),
                child: Icon(
                  icon,
                  size: 35,
                ))),
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.orange),
        ),
      ),
      obscureText: isobsecure,
    );
  }
}
