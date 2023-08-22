import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/user_profile.dart';
import 'package:sipbara/controller/wisata/wisata_controller.dart';
import 'package:sipbara/style/color.dart';

import '../../../model/review/review.dart';

class OpenReviewWidget extends StatefulWidget {
  final Review review;
  const OpenReviewWidget({Key? key, required this.review}) : super(key: key);

  @override
  _OpenReviewWidgetState createState() => _OpenReviewWidgetState();
}

class _OpenReviewWidgetState extends State<OpenReviewWidget> {
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
          iconTheme: const IconThemeData(color: SIPColor.primaryText),
          title: const Text(
            'Check Review',
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
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: SIPColor.secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder(
                                    future: readProfile(widget.review.userUid),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final data = snapshot.data!;
                                        return Text(
                                          '${data['name']}',
                                          style: const TextStyle(
                                            fontFamily: 'Outfit',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: SIPColor.primaryText,
                                          ),
                                        );
                                      } else {
                                        return const Text(
                                          'Nama',
                                          style: TextStyle(
                                            fontFamily: 'Outfit',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500,
                                            color: SIPColor.primaryText,
                                          ),
                                        );
                                      }
                                    }),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 4),
                                  child: RatingBarIndicator(
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star_rounded,
                                      color: SIPColor.warning,
                                    ),
                                    direction: Axis.horizontal,
                                    rating: widget.review.rating,
                                    unratedColor: const Color(0xFF95A1AC),
                                    itemCount: 5,
                                    itemSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: SIPColor.alternate,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: FutureBuilder(
                                          future: readProfile(
                                              widget.review.userUid),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              final data = snapshot.data!;
                                              return Image.network(
                                                '${data['imageUrl']}',
                                                fit: BoxFit.cover,
                                              );
                                            } else {
                                              return Image.network(
                                                'https://firebasestorage.googleapis.com/v0/b/sipbara-603fc.appspot.com/o/images%2Fprofile%2FmwXUpLg1ceN6DKImBIDmzXCl1dC3%2F_iqbal_yoga_hutama_profilePicture?alt=media&token=dc059526-6964-48b6-9a73-b571794739b1',
                                                fit: BoxFit.cover,
                                              );
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
                        child: Row(
                          children: [
                            FutureBuilder(
                                future:
                                    readDetailWisata(widget.review.idWisata),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final data = snapshot.data!;
                                    return Text(
                                      '${data['namaWisata']}',
                                      style: const TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20,
                                        color: SIPColor.secondaryText,
                                      ),
                                    );
                                  } else {
                                    return const Text(
                                      'Nama Wisata',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20,
                                        color: SIPColor.secondaryText,
                                      ),
                                    );
                                  }
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                widget.review.review,
                                style: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16,
                                  color: SIPColor.secondaryText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.confirm,
                                    title: 'Konfirmasi',
                                    text: 'Konfirmasi Review ini',
                                    confirmBtnText: 'Iya',
                                    confirmBtnColor: SIPColor.success,
                                    cancelBtnText: 'Tidak',
                                    showCancelBtn: true,
                                    onConfirmBtnTap: () async {
                                      print('lihat');
                                      DocumentReference docRef =
                                          FirebaseFirestore.instance
                                              .collection('review')
                                              .doc(widget.review.idWisata);
                                      DocumentSnapshot doc = await docRef.get();
                                      List reviews = doc.get('reviews');
                                      print(reviews);
                                      for (int i = 0; i < reviews.length; i++) {
                                        if (reviews[i]['userId'] ==
                                            widget.review.userUid) {
                                          await docRef.update({
                                            'reviews': FieldValue.arrayRemove(
                                                [reviews[i]])
                                          });
                                          reviews[i]['isViewed'] = true;
                                          await docRef.update({
                                            'reviews': FieldValue.arrayUnion(
                                                [reviews[i]])
                                          });
                                        }
                                      }
                                      Navigator.of(context).pop();
                                    });
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: SIPColor.success,
                                  fixedSize: const Size(60, 60)),
                              child: const Icon(Icons.remove_red_eye_rounded),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    title: 'Peringatan',
                                    text: 'Anda yakin ingin menghapus review?',
                                    confirmBtnText: 'ya',
                                    confirmBtnColor: SIPColor.error,
                                    cancelBtnText: 'Tidak',
                                    showCancelBtn: true,
                                    onConfirmBtnTap: () async {
                                      DocumentReference docRef =
                                          FirebaseFirestore.instance
                                              .collection('review')
                                              .doc(widget.review.idWisata);
                                      DocumentSnapshot doc = await docRef.get();
                                      List reviews = doc.get('reviews');
                                      print(reviews);
                                      for (int i = 0; i < reviews.length; i++) {
                                        if (reviews[i]['userId'] ==
                                            widget.review.userUid) {
                                          docRef.update({
                                            'reviews': FieldValue.arrayRemove(
                                                [reviews[i]])
                                          });
                                        }
                                      }
                                      Navigator.of(context).pop();
                                    });
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: SIPColor.error,
                                  fixedSize: const Size(60, 60)),
                              child: const Icon(Icons.delete_rounded),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
