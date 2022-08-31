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
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? firebaseuser = result.user;
      return true;
    } catch (e) {
      Get.snackbar("error", e.toString());
      return false;
    }
  }
}
