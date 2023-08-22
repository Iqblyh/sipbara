import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:sipbara/controller/event_controller.dart';
import 'package:sipbara/controller/penginapan_controller.dart';
import 'package:sipbara/controller/wisata/wisata_controller.dart';

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  late CollectionReference gambarRef;
  late firebase_storage.Reference reference;

  Future<void> uploadFile(
    String filePath,
    String subPath,
    String fileName,
  ) async {
    File file = File(filePath);

    try {
      await storage.ref('images/$subPath/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results =
        await storage.ref('images/').listAll();

    results.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });
    return results;
  }

  Future<String> downloadURL(String subPath, String imageName) async {
    String downloadURL =
        await storage.ref('/images/$subPath/$imageName').getDownloadURL();

    return downloadURL;
  }

  Future uploadMedia(List<File> _image, String subPath, String idWisata) async {
    print(_image);
    var date = DateTime.now();
    int index = 0;
    String addName =
        '${date.year}${date.month}${date.day}${date.minute}${date.second}';
    for (var gambar in _image) {
      index += 1;
      String imageName = '${subPath}_$index$addName';
      print('HAHAHAHAHAHHA : $index');
      reference = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/$subPath/$imageName');

      await reference.putFile(gambar).whenComplete(() async {
        await reference.getDownloadURL().then((value) {
          tambahMedia(imageName, value, idWisata);
        });
      });
    }
  }

  Future deleteImage(String idWisata, String subPath, String imageName) async {
    final desertRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/$subPath/$imageName');

    await desertRef.delete();
  }

  Future deleteAllDocImage(String subPath) async {
    final desertRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/$subPath');

    await desertRef.listAll().then((value) async {
      List valueList = value.items.toList();
      int length = valueList.length;
      print('HAHAHAHAHAH $length');

      await firebase_storage.FirebaseStorage.instance
          .ref(value.items.first.fullPath)
          .delete();
    });
  }

  Future uploadMediaEvent(
      List<File> _image, String subPath, String idEvent) async {
    print(_image);
    var date = DateTime.now();
    int index = 0;
    String addName =
        '${date.year}${date.month}${date.day}${date.minute}${date.second}';
    for (var gambar in _image) {
      index += 1;
      String imageName = '${subPath}_$index$addName';
      print('HAHAHAHAHAHHA : $index');
      reference = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/$subPath/$imageName');

      await reference.putFile(gambar).whenComplete(() async {
        await reference.getDownloadURL().then((value) {
          tambahMediaEvent(imageName, value, idEvent);
        });
      });
    }
  }

  Future uploadMediaPenginapan(
      List<File> _image, String subPath, String idPenginapan) async {
    print(_image);
    var date = DateTime.now();
    int index = 0;
    String addName =
        '${date.year}${date.month}${date.day}${date.minute}${date.second}';
    for (var gambar in _image) {
      index += 1;
      String imageName = '${subPath}_$index$addName';
      print('HAHAHAHAHAHHA : $index');
      reference = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('images/$subPath/$imageName');

      await reference.putFile(gambar).whenComplete(() async {
        await reference.getDownloadURL().then((value) {
          tambahMediaPenginapan(imageName, value, idPenginapan);
        });
      });
    }
  }
}
