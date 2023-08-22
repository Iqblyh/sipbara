import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/review_controller.dart';
import 'package:sipbara/model/review/review.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/button_widget.dart';

class AddReviewWidget extends StatefulWidget {
  final String idWisata;
  const AddReviewWidget({Key? key, required this.idWisata}) : super(key: key);

  @override
  _AddReviewWidgetState createState() => _AddReviewWidgetState();
}

class _AddReviewWidgetState extends State<AddReviewWidget> {
  double _rating = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final reviewController = TextEditingController();

  final currentUser = FirebaseAuth.instance.currentUser!;

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
        backgroundColor: SIPColor.secondaryBackground,
        appBar: AppBar(
          backgroundColor: SIPColor.secondaryBackground,
          iconTheme: IconThemeData(color: SIPColor.primaryText),
          title: const Text(
            'Review',
            style: TextStyle(
              fontSize: 22,
              color: SIPColor.primaryText,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tambah Review',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: SIPColor.primaryText,
                      fontSize: 24,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      'Masukan rating dan review dibawah',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Readex Pro',
                        color: SIPColor.secondaryText,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                      child: RatingBar.builder(
                        onRatingUpdate: (newValue) {
                          setState(() {
                            _rating = newValue;
                          });
                          print('Rating : $_rating');
                        },
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: SIPColor.tertiary,
                        ),
                        direction: Axis.horizontal,
                        initialRating: _rating,
                        unratedColor: SIPColor.accent3,
                        itemCount: 5,
                        itemSize: 40,
                        glowColor: SIPColor.tertiary,
                      ),
                    ),
                  ),
                  Column(mainAxisSize: MainAxisSize.max, children: [
                    TextFormField(
                      controller: reviewController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.normal,
                          color: SIPColor.secondaryText,
                        ),
                        hintText: 'Tulis review pada kolom ini',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.normal,
                          color: SIPColor.secondaryText,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(16, 24, 16, 12),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        color: SIPColor.primaryText,
                      ),
                      maxLines: 16,
                      minLines: 6,
                      cursorColor: SIPColor.primaryColor,
                    ),
                  ]),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                      child: SIPEleButton_Large_Icon(
                        onPressed: () {
                          final review = Review(
                              userUid: currentUser.uid,
                              review: reviewController.text,
                              rating: _rating,
                              idWisata: widget.idWisata,
                              isViewed: false);
                          tambahReview(review, widget.idWisata)
                              .whenComplete(() {
                            QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                text: 'Berhasil menambahkan review!',
                                onConfirmBtnTap: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                });
                          });
                        },
                        icon: Icons.reviews,
                        textButton: 'Tambah Review',
                        colorBg: SIPColor.primaryColor,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
