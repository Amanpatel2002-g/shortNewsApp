// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthPageButton extends StatelessWidget {
  const AuthPageButton({
    Key? key,
    required this.buttontext,
  }) : super(key: key);
  final String buttontext;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromARGB(255, 234, 130, 11)),
      alignment: Alignment.center,
      child: Text(
        buttontext,
        style:
            const TextStyle(color: Color.fromARGB(255, 5, 5, 5), fontSize: 20),
      ),
    );
  }
}
