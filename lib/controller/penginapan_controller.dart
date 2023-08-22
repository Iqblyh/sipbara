import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sipbara/controller/storage_service.dart';
import 'package:sipbara/model/penginapan/penginapan.dart';

Future tambahPenginapan(Penginapan penginapan) async {
  final docPenginapan =
      FirebaseFirestore.instance.collection('penginapan').doc();

  penginapan.id = docPenginapan.id;
  final json = penginapan.toJson();
  await docPenginapan.set(json);
}

Stream<List<Penginapan>> readPenginapan() => FirebaseFirestore.instance
    .collection('penginapan')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Penginapan.fromJson(doc.data())).toList());

Future<DocumentSnapshot<Map<String, dynamic>>> readDetailPenginapan(
        String idPenginapan) =>
    FirebaseFirestore.instance.collection('penginapan').doc(idPenginapan).get();

Future<void> updatePenginapan(Penginapan penginapan) async {
  print(penginapan.id);
  final docWisata =
      FirebaseFirestore.instance.collection('penginapan').doc(penginapan.id);
  await docWisata.update(penginapan.toJsonUpdate());
}

Stream<DocumentSnapshot<Map<String, dynamic>>> readMedias(
        String idPenginapan) =>
    FirebaseFirestore.instance
        .collection('penginapan')
        .doc(idPenginapan)
        .snapshots();

Future tambahMediaPenginapan(
    String imageName, String imageUrl, String idPenginapan) async {
  List listGambar = [];
  print("Id Penginapan: $idPenginapan");
  listGambar.add({
    'imageName': imageName,
    'imageUrl': imageUrl,
  });
  final docWisata =
      FirebaseFirestore.instance.collection('penginapan').doc(idPenginapan);

  await docWisata.update({
    "images": FieldValue.arrayUnion(listGambar),
  });
}

Future<void> deletePenginapan(String idPenginapan, String subPath) async {
  int length = 0;
  final docPenginapan =
      FirebaseFirestore.instance.collection('penginapan').doc(idPenginapan);

  final desertRef = FirebaseStorage.instance.ref().child('images/$subPath');

  await desertRef.listAll().then((value) async {
    List valueList = value.items.toList();
    length = valueList.length;
  });

  await docPenginapan.delete().whenComplete(() async {
    for (var i = 0; i < length; i++) {
      await Storage().deleteAllDocImage(subPath);
    }
  });
}
