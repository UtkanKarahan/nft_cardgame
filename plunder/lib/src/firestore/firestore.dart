import 'package:cloud_firestore/cloud_firestore.dart';



class FirestoreService{
  final FirebaseFirestore _firestore;

  FirestoreService(this._firestore);

  Future<void> addUser(String address, String username) async {
    await _firestore.collection("users").add(
        {
          "token_id" : address,
          "username" : username,
          "win" : 0,
          "lose" : 0,
          "draw" : 0,
        }
    );
  }

}




