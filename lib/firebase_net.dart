
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String displayName,String displayAddress, String displayDob ) async {
  CollectionReference users = FirebaseFirestore.instance.collection('UserDetails');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  //String _controller = auth.currentUser._controller.toString();
  users.add({'displayName': displayName,'displayAddress': displayAddress,"displayDob": displayDob, 'uid': uid,});
  return;
}
