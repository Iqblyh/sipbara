class Kuliner {
  String id;
  late final String deskripsi;
  late final String namaKuliner;
  final String thumbnail_image;

  Kuliner({
    this.id = '',
    required this.namaKuliner,
    required this.deskripsi,
    required this.thumbnail_image,
  });

  Map<String, dynamic> toJson() => {
        'idKuliner': id,
        'nama': namaKuliner,
        'deskripsi': deskripsi,
        'thumbnail': thumbnail_image,
      };

  Map<String, dynamic> toJsonUpdate() => {
        'idKuliner': id,
        'nama': namaKuliner,
        'deskripsi': deskripsi,
        'thumbnail': thumbnail_image,
      };

  static Kuliner fromJson(Map<String, dynamic> json) => Kuliner(
        id: json['idKuliner'],
        namaKuliner: json['nama'],
        deskripsi: json['deskripsi'],
        thumbnail_image: json['thumbnail'],
      );
}
