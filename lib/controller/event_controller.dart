import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sipbara/controller/storage_service.dart';

import '../model/event/event.dart';

Future tambahEvent(Event event) async {
  final docEvent = FirebaseFirestore.instance.collection('event').doc();

  event.id = docEvent.id;
  final json = event.toJson();
  await docEvent.set(json);
}

Stream<List<Event>> readEvent() =>
    FirebaseFirestore.instance.collection('event').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Event.fromJson(doc.data())).toList());

Stream<List<Event>> readEventActive() => FirebaseFirestore.instance
    .collection('event')
    .where('tanggal_end', isGreaterThanOrEqualTo: DateTime.now())
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Event.fromJson(doc.data())).toList());

Stream<List<Event>> readEventNotActive() => FirebaseFirestore.instance
    .collection('event')
    .where('tanggal_end', isLessThan: DateTime.now())
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Event.fromJson(doc.data())).toList());

Future<DocumentSnapshot<Map<String, dynamic>>> readDetailEvent(
        String idEvent) =>
    FirebaseFirestore.instance.collection('event').doc(idEvent).get();

Stream<DocumentSnapshot<Map<String, dynamic>>> readMedias(String idEvent) =>
    FirebaseFirestore.instance.collection('event').doc(idEvent).snapshots();

Future tambahMediaEvent(
    String imageName, String imageUrl, String idEvent) async {
  List listGambar = [];
  print("Id Event: $idEvent");
  listGambar.add({
    'imageName': imageName,
    'imageUrl': imageUrl,
  });
  final docWisata = FirebaseFirestore.instance.collection('event').doc(idEvent);

  await docWisata.update({
    "images": FieldValue.arrayUnion(listGambar),
  });
}

Future<void> updateEvent(Event event) async {
  print(event.id);
  final docWisata =
      FirebaseFirestore.instance.collection('event').doc(event.id);
  await docWisata.update(event.toJsonUpdate());
}

Future<void> deleteEvent(String idEvent, String subPath) async {
  int length = 0;
  final docWisata = FirebaseFirestore.instance.collection('event').doc(idEvent);

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
