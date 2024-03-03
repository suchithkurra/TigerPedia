import 'package:cloud_firestore/cloud_firestore.dart';

class Data{
  Future addUser(String userId, Map<String, dynamic> userInfomap){
    return FirebaseFirestore.instance.collection("user").doc(userId).set(userInfomap);

  }
}