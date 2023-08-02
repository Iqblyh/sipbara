import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sipbara/main.dart';

import '../helper/utils.dart';

Future<bool> isAdmin() async {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final DocumentSnapshot db = await FirebaseFirestore.instance
      .collection('user')
      .doc(currentUser.uid)
      .get();

  return db['isAdmin'];
}

Future signIn(BuildContext context, String email, String password) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  } on FirebaseAuthException catch (e) {
    print(e);

    Utils.showSnackBar(e.message);
  }

  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}

Future signUp(BuildContext context, String email, String password,
    GlobalKey<FormState> formKey) async {
  final isValid = formKey.currentState!.validate();
  if (!isValid) return;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  } on FirebaseAuthException catch (e) {
    print(e);

    Utils.showSnackBar(e.message);
  }
  navigatorKey.currentState!.popUntil((route) => route.isFirst);
}

Future resetPassword(BuildContext context, String email) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());

    Utils.showSnackBar('Email Atur Ulang Sandi Dikirim!');
    Navigator.of(context).popUntil((route) => route.isFirst);
  } on FirebaseException catch (e) {
    print(e);

    Utils.showSnackBar(e.message);
    Navigator.of(context).pop();
  }
}
