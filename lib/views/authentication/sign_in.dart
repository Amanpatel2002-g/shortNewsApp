import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortnewsapp/views/widgets/auth_page_button.dart';
import 'package:shortnewsapp/views/widgets/textInputField.dart';

import '../../models/data_base.dart';
import '../constants.dart';

final ConstantsVariables cv = Get.find();

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  signMeIn(String email, String password) {
    // Get.snackbar("oh its working", "work hard everyday");
    print("we have crossed line 0");
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email) &&
        password.length > 4) {
      print("we have crossed line 1");
      // ignore: unrelated_type_equality_checks
      DataBaseMethods.signInWithEmailAndPassword(email, password).then((value) {
        if (value) {
          Get.snackbar("Successful", "The last sign In was successful");
          cv.isUserSignedIn.value = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                  icon: Icons.email),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
                onTap: () {
                  signMeIn(_emailTextEditingController.text,
                      _passwordTextEditingController.text);
                },
                child: const AuthPageButton(buttontext: "Sign In")),
            const SizedBox(
              height: 15,
            ),
            const AuthPageButton(buttontext: "Sign In With google"),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have a account",
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    cv.isOnSignInPage.value = false;
                  },
                  child: Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text("register here",
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
    );
  }
}
