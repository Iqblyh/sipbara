import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:sipbara/controller/storage_service.dart';

import '../../model/wisata/wisata.dart';

Future tambahWisata(Wisata wisata) async {
  final docWisata = FirebaseFirestore.instance.collection('wisata').doc();

  wisata.id = docWisata.id;
  final json = wisata.toJson();
  await docWisata.set(json);
}

Future tambahMedia(String imageName, String imageUrl, String idWisata) async {
  List listGambar = [];
  print("Id Wisata: $idWisata");
  listGambar.add({
    'imageName': imageName,
    'imageUrl': imageUrl,
  });
  final docWisata =
      FirebaseFirestore.instance.collection('wisata').doc(idWisata);

  await docWisata.update({
    "images": FieldValue.arrayUnion(listGambar),
  });
}

Stream<List<Wisata>> readWisata() => FirebaseFirestore.instance
    .collection('wisata')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Wisata.fromJson(doc.data())).toList());

Future<DocumentSnapshot<Map<String, dynamic>>> readDetailWisata(
        String idWisata) =>
    FirebaseFirestore.instance.collection('wisata').doc(idWisata).get();

Stream<DocumentSnapshot<Map<String, dynamic>>> readMedias(String idWisata) =>
    FirebaseFirestore.instance.collection('wisata').doc(idWisata).snapshots();

Future<void> updateWisata(Wisata wisata) async {
  print(wisata.id);
  final docWisata =
      FirebaseFirestore.instance.collection('wisata').doc(wisata.id);
  await docWisata.update(wisata.toJsonUpdate());
}

Future<void> deleteWisata(String idWisata, String subPath) async {
  int length = 0;
  final docWisata =
      FirebaseFirestore.instance.collection('wisata').doc(idWisata);

  final desertRef = FirebaseStorage.instance.ref().child('images/$subPath');

  await desertRef.listAll().then((value) async {
    List valueList = value.items.toList();
    length = valueList.length;
  });

  await docWisata.delete().whenComplete(() async {
    for (var i = 0; i < length; i++) {
      await Storage().deleteAllDocImage(subPath);
    }
  });
}
