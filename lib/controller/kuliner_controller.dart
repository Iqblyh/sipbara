import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sipbara/controller/storage_service.dart';

import '../model/kuliner/kuliner.dart';

Future tambahKuliner(Kuliner kuliner) async {
  final docKuliner =
      FirebaseFirestore.instance.collection('oleh_kuliner').doc();

  kuliner.id = docKuliner.id;
  final json = kuliner.toJson();
  await docKuliner.set(json);
}

Stream<List<Kuliner>> readKuliner() => FirebaseFirestore.instance
    .collection('oleh_kuliner')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Kuliner.fromJson(doc.data())).toList());

Future<DocumentSnapshot<Map<String, dynamic>>> readDetailKuliner(
        String idKuliner) =>
    FirebaseFirestore.instance.collection('oleh_kuliner').doc(idKuliner).get();

Future<void> deleteKuliner(String idKuliner, String subPath) async {
  int length = 0;
  final docKuliner =
      FirebaseFirestore.instance.collection('oleh_kuliner').doc(idKuliner);

  final desertRef = FirebaseStorage.instance.ref().child('images/$subPath');

  await desertRef.listAll().then((value) async {
    List valueList = value.items.toList();
    length = valueList.length;
  });

  await docKuliner.delete().whenComplete(() async {
    for (var i = 0; i < length; i++) {
      await Storage().deleteAllDocImage(subPath);
    }
  });
}

Future<void> updateKuliner(Kuliner kuliner) async {
  print(kuliner.id);
  final docKuliner =
      FirebaseFirestore.instance.collection('oleh_kuliner').doc(kuliner.id);
  await docKuliner.update(kuliner.toJsonUpdate());
}
