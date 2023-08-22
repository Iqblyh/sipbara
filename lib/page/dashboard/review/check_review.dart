import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sipbara/controller/review_controller.dart';
import 'package:sipbara/model/review/review.dart';
import 'package:sipbara/page/dashboard/review/open_review.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/card_widget.dart';

class CheckReviewWidget extends StatefulWidget {
  const CheckReviewWidget({Key? key}) : super(key: key);

  @override
  _CheckReviewWidgetState createState() => _CheckReviewWidgetState();
}

class _CheckReviewWidgetState extends State<CheckReviewWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: SIPColor.primaryBackground,
        appBar: AppBar(
          backgroundColor: SIPColor.primaryBackground,
          iconTheme: IconThemeData(color: SIPColor.primaryText),
          title: const Text(
            'Review Terbaru',
            style: TextStyle(
              fontFamily: 'Outfit',
              color: SIPColor.primaryText,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('review')
                        .snapshots(),
                    builder: (context, snapshot) {
                      List unviewedReview = [];

                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Text('No data available.');
                      }

                      for (int i = 0; i < snapshot.data!.docs.length; i++) {
                        var document = snapshot.data!.docs[i];
                        // Access fields using document['fieldName']
                        List reviews = document['reviews'];

                        for (int i = 0; i < reviews.length; i++) {
                          if (reviews[i]['isViewed'] == false) {
                            unviewedReview.add(reviews[i]);
                          }
                        }
                      }

                      // Process and display your data here
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: unviewedReview.length,
                        itemBuilder: (context, index) {
                          print(unviewedReview);
                          var rating = unviewedReview[index]['rating'];
                          return CardCheckReview(
                              reviews: Review(
                            idWisata: unviewedReview[index]['idWisata'],
                            review: unviewedReview[index]['review'],
                            isViewed: unviewedReview[index]['isViewed'],
                            rating: rating.toDouble(),
                            userUid: unviewedReview[index]['userId'],
                          ));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
