import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortnewsapp/models/data_base.dart';
import 'package:shortnewsapp/views/authentication/sign_in.dart';
import 'package:shortnewsapp/views/scroll_pageview.dart';
import 'package:shortnewsapp/views/widgets/auth_page_button.dart';
import 'package:shortnewsapp/views/widgets/textInputField.dart';

import '../constants.dart';

final ConstantsVariables cv = Get.find();

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  signMeUp(String username, String email, String password) {
    // Get.snackbar("oh its working", "work hard everyday");
    print("we have crossed line 0");
    if (username.length > 4 &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email) &&
        password.length > 4) {
      print("we have crossed line 1");
      // ignore: unrelated_type_equality_checks
      DataBaseMethods.signUpWithUserNameAndPassword(email, password)
          .then((value) {
        if (value) {
          Get.snackbar("Successful", "The last sign up was successful");
          cv.isUserSignedIn.value = true;
        }
      });
    }
  }

  final TextEditingController _userNameTextEditingController =
      TextEditingController();

  final TextEditingController _emailTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInpurField(
                    controller: _userNameTextEditingController,
                    labelText: "Username",
                    icon: Icons.person),
              ), // this is for email
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInpurField(
                    controller: _emailTextEditingController,
                    labelText: "Email",
                    icon: Icons.email),
              ), // this is for email
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInpurField(
                    controller: _passwordTextEditingController,
                    labelText: "password",
                    icon: Icons.lock),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                  onTap: () {
                    signMeUp(
                        _userNameTextEditingController.text,
                        _emailTextEditingController.text,
                        _passwordTextEditingController.text);
                  },
                  child: const AuthPageButton(buttontext: "Sign Up")),
              const SizedBox(
                height: 15,
              ),
              const AuthPageButton(buttontext: "Sign Up with google"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already a user?",
                    style: TextStyle(fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      cv.isOnSignInPage.value = true;
                    },
                    child: Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: const Text("sign in here",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.red,
                                decoration: TextDecoration.underline))),
                  )
                ],
              )
              // this is for password
            ],
          ),
        ),
      ),
    );
  }
}
