class User {
  final String profilePicture;
  final String nama;
  final String bio;

  User({
    required this.nama,
    required this.bio,
    required this.profilePicture,
  });

  Map<String, dynamic> toJson() => {
        'name': nama,
        'profileBio': bio,
        'imageUrl': profilePicture,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        nama: json['name'],
        bio: json['bio'],
        profilePicture: json['imageUrl'],
      );
}
