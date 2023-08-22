class Images {
  final String imageName;
  final String imageUrl;

  Images({required this.imageName, required this.imageUrl});
}

class Penginapan {
  String id;
  late final String deskripsi;
  late final String namaPenginapan;
  final String thumbnail_image;
  final double hargaKisaran;
  final List? images;
  final String contact;

  Penginapan({
    this.id = '',
    required this.namaPenginapan,
    required this.deskripsi,
    required this.thumbnail_image,
    required this.contact,
    required this.hargaKisaran,
    this.images,
  });

  Map<String, dynamic> toJson() => {
        'idPenginapan': id,
        'harga_kisaran': hargaKisaran,
        'nama_penginapan': namaPenginapan,
        'deskripsi_penginapan': deskripsi,
        'thumbnail': thumbnail_image,
        'contact': contact,
        'images': images,
      };

  Map<String, dynamic> toJsonUpdate() => {
        'idPenginapan': id,
        'nama_penginapan': namaPenginapan,
        'deskripsi_penginapan': deskripsi,
        'thumbnail': thumbnail_image,
        'contact': contact,
      };

  static Penginapan fromJson(Map<String, dynamic> json) => Penginapan(
        id: json['idPenginapan'],
        namaPenginapan: json['nama_penginapan'],
        deskripsi: json['deskripsi_penginapan'],
        thumbnail_image: json['thumbnail'],
        contact: json['contact'],
        hargaKisaran: double.parse((json['harga_kisaran']).toString()),
      );
}
