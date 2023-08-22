import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fire_auth;

import '../model/user/user.dart';

Future<void> updateProfile(User user) async {
  final currentUser = await fire_auth.FirebaseAuth.instance.currentUser!;
  final docWisata =
      FirebaseFirestore.instance.collection('user').doc(currentUser.uid);
  await docWisata.update(user.toJson());
}

Future<DocumentSnapshot<Map<String, dynamic>>> readProfile(String userId) =>
    FirebaseFirestore.instance.collection('user').doc(userId).get();
