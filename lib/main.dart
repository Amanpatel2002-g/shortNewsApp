import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shortnewsapp/views/authentication/sign_in.dart';
import 'package:shortnewsapp/views/authentication/sign_up.dart';
import 'package:shortnewsapp/views/constants.dart';
import 'package:shortnewsapp/views/home_page.dart';
import 'package:shortnewsapp/views/newspage.dart';
import 'package:shortnewsapp/views/scroll_pageview.dart';

void main(List<String> args) async {
  final ConstantsVariables cv = Get.put(ConstantsVariables());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyshortNewsApp());
}

final ConstantsVariables cv = Get.find();

class MyshortNewsApp extends StatelessWidget {
  // const MyshortNewsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Short News App",
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        home: Obx((() {
          if (cv.isUserSignedIn.value) {
            return ScrollPageView();
          }
          else if (cv.isOnSignInPage.value) {
            return SignInPage();
          } else {
            return SignUpPage();
          }
        })));
    // home: ScrollPageView());
  }
}
