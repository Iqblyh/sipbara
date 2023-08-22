class Images {
  final String imageName;
  final String imageUrl;

  Images({required this.imageName, required this.imageUrl});
}

class Wisata {
  String id;
  late final String deskripsi_wisata;
  late final String nama_wisata;
  final String thumbnail_image;
  final String lat;
  final String long;
  final List? images;

  Wisata({
    this.id = '',
    required this.nama_wisata,
    required this.deskripsi_wisata,
    required this.thumbnail_image,
    required this.lat,
    required this.long,
    this.images,
  }) : namaWisataLowercase = nama_wisata.toLowerCase();

  Map<String, dynamic> toJson() => {
        'idWisata': id,
        'namaWisata': nama_wisata,
        'deskripsiWisata': deskripsi_wisata,
        'thumbnail': thumbnail_image,
        'lat': lat,
        'long': long,
        'images': images,
      };

  Map<String, dynamic> toJsonUpdate() => {
        'idWisata': id,
        'namaWisata': nama_wisata,
        'deskripsiWisata': deskripsi_wisata,
        'thumbnail': thumbnail_image,
        'lat': lat,
        'long': long,
      };

  static Wisata fromJson(Map<String, dynamic> json) => Wisata(
        id: json['idWisata'],
        nama_wisata: json['namaWisata'],
        deskripsi_wisata: json['deskripsiWisata'],
        thumbnail_image: json['thumbnail'],
        lat: json['lat'],
        long: json['long'],
      );

  final String namaWisataLowercase;
}
