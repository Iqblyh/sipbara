class Reviews {
  List<Review>? reviews;

  Reviews({this.reviews});
  Map<String, dynamic> toJson() => {'reviews': reviews};
}

class Review {
  final String idWisata;
  final String userUid;
  final String review;
  final double rating;
  final bool isViewed;

  Review({
    required this.idWisata,
    required this.userUid,
    required this.review,
    required this.rating,
    required this.isViewed,
  });

  Map<String, dynamic> toJson() => {
        'review': review,
        'rating': rating,
        'userId': userUid,
      };

  static Review fromJson(Map<String, dynamic> json) => Review(
        idWisata: json['idWisata'],
        review: json['review'],
        rating: json['rating'],
        userUid: json['userId'],
        isViewed: json['isViewed'],
      );
}
