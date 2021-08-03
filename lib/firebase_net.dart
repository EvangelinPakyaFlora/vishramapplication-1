
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String displayName, String displayDob, String displayAddress,String displayPin,String displayEmail,String displayPhNum,String displayState, String displayCity ) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  DocumentReference users = FirebaseFirestore.instance.collection('UserDetails').doc(auth.currentUser.uid);

  String uid = auth.currentUser.uid.toString();
  //String _controller = auth.currentUser._controller.toString();
  users.set({'displayName': displayName,"displayDob": displayDob, 'displayAddress': displayAddress,"displayPin": displayPin, "displayEmail": displayEmail,"displayPhNum": displayPhNum,"displayState": displayState,"displayCity": displayCity,"uid":uid});
  return;
}
