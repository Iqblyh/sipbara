import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sipbara/model/review/review.dart';

// Future tambahReview(Review review, String idWisata) async {
//   List listReview = [];
//   print("Id Wisata: $idWisata");
//   listReview.add({
//     'review': review.review,
//     'rating': review.rating,
//     'userId': review.userUid,
//   });
//   final docReview =
//       FirebaseFirestore.instance.collection('review').doc(idWisata);
//
//   await docReview.update({
//     "reviews": FieldValue.arrayUnion(listReview),
//   });
// }

Stream<DocumentSnapshot<Map<String, dynamic>>> readReviews(String idWisata) =>
    FirebaseFirestore.instance.collection('review').doc(idWisata).snapshots();

Stream<QuerySnapshot<Map<String, dynamic>>> readNotViewedReviews() =>
    FirebaseFirestore.instance
        .collection('review')
        .where('reviews', arrayContains: {'isViewed': false}).snapshots();

Future tambahReview(Review review, String idWisata) async {
  try {
    final docReview =
        FirebaseFirestore.instance.collection('review').doc(idWisata);
    final docSnapshot = await docReview.get();

    if (docSnapshot.exists) {
      // Fetch existing reviews and check for the same userId
      Map<String, dynamic>? existingData = docSnapshot.data();
      List<dynamic> existingReviews = [];
      if (existingData != null && existingData.containsKey('reviews')) {
        existingReviews = List<dynamic>.from(existingData['reviews']);
      }

      final String currentUserId = review.userUid;
      bool userAlreadyReviewed = false;

      for (var existingReview in existingReviews) {
        if (existingReview['userId'] == currentUserId) {
          // User already reviewed, update the existing review instead
          await docReview.update({
            "reviews": FieldValue.arrayRemove([existingReview]),
          });
          await docReview.update({
            "reviews": FieldValue.arrayUnion([
              {
                'review': review.review,
                'rating': review.rating,
                'userId': review.userUid,
                'isViewed': review.isViewed,
                'idWisata': review.idWisata,
              }
            ]),
          });
          userAlreadyReviewed = true;
          break;
        }
      }

      // If the user ID doesn't exist, add a new review
      if (!userAlreadyReviewed) {
        await docReview.update({
          "reviews": FieldValue.arrayUnion([
            {
              'review': review.review,
              'rating': review.rating,
              'userId': review.userUid,
              'isViewed': review.isViewed,
              'idWisata': review.idWisata,
            }
          ]),
        });
      }
    } else {
      // Document doesn't exist, create a new document with the review
      await docReview.set({
        "reviews": [
          {
            'review': review.review,
            'rating': review.rating,
            'userId': review.userUid,
            'isViewed': review.isViewed,
            'idWisata': review.idWisata,
          }
        ]
      });
    }
  } catch (e) {
    print("Error adding/updating review: $e");
    // Handle the error as per your requirement
  }
}

Future deleteReview(String idWisata, String idUser) async {}
