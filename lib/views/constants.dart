import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ConstantsVariables extends GetxController {
  String testext =
      "Democracy is mainly a Greek word which means people and their rules, here peoples have the to select their own government as per their choice. Greece was the first democratic country in the world. India is a democratic country where people select their government of their own choice, also people have the rights to do the work of their choice. There are two types of democracy: direct and representative and hybrid or semi-direct democracy. There are many decisions which are made under democracies. People enjoy few rights which are very essential for human beings to live happily. ";

  String headingtext =
      "How is the democracy defined in the world and what are the types of democracy that you should check out if they can be asked in exam";

  RxBool isUserSignedIn = false.obs;
  RxBool isOnSignInPage = true.obs;
  RxString tosearch = "india".obs;
  static var theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
  );
  // theme: ConstantsVariables.theme,
}
