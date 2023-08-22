import 'package:cloud_firestore/cloud_firestore.dart';

class Images {
  final String imageName;
  final String imageUrl;

  Images({required this.imageName, required this.imageUrl});
}

class Event {
  String id;
  late final String deskripsi_event;
  late final String nama_event;
  final String thumbnail_image;
  final List? images;
  final String contact;
  final DateTime time_start;
  final DateTime time_end;

  Event({
    this.id = '',
    required this.nama_event,
    required this.deskripsi_event,
    required this.thumbnail_image,
    required this.time_start,
    required this.time_end,
    required this.contact,
    this.images,
  }) : namaWisataLowercase = nama_event.toLowerCase();

  Map<String, dynamic> toJson() => {
        'idEvent': id,
        'nama_event': nama_event,
        'deskripsi_event': deskripsi_event,
        'thumbnail': thumbnail_image,
        'contact': contact,
        'images': images,
        'tanggal_start': time_start,
        'tanggal_end': time_end,
      };

  Map<String, dynamic> toJsonUpdate() => {
        'idEvent': id,
        'nama_event': nama_event,
        'deskripsi_event': deskripsi_event,
        'thumbnail': thumbnail_image,
        'tanggal_start': time_start,
        'tanggal_end': time_end,
        'contact': contact,
      };

  static Event fromJson(Map<String, dynamic> json) => Event(
        id: json['idEvent'],
        nama_event: json['nama_event'],
        deskripsi_event: json['deskripsi_event'],
        thumbnail_image: json['thumbnail'],
        time_start: (json['tanggal_start'] as Timestamp).toDate(),
        time_end: (json['tanggal_end'] as Timestamp).toDate(),
        contact: json['contact'],
      );

  final String namaWisataLowercase;
}
