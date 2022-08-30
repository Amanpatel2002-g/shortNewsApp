import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireauth/fireauth.dart';
import 'package:get/get.dart';

class DataBaseMethods {
  // ignore: non_constant_identifier_names

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future uploadFirebasedata(apimap) async {
    await FirebaseFirestore.instance.collection("newsdata").add(apimap);
  }

  static Future signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseuser = result.user;
      return true;
    } catch (e) {
      Get.snackbar("error", "Unable to sign in user");
      return false;
    }
  }

  static Future<bool> signUpWithUserNameAndPassword(
      String email, String password) async {
    print("We are  in signUpWithUserNameAndPassword");
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("we have crossed line0 in signUpWithUserNameAndPassword");
      User? firebaseuser = result.user;
      print("we have crossed line1 in signUpWithUserNameAndPassword");
      return true;
    } catch (e) {
      print(e.toString());
      print("sorry we cannot move forward with in signUpWithUserNameAndPassword");
      Get.snackbar("error", e.toString());
      return false;
    }
  }
}
