import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DataBaseMethods {
  // ignore: non_constant_identifier_names
  static Future upload_firebasedata(apimap) async{
    await FirebaseFirestore.instance.collection("newsdata").add(apimap);
  }
}
