import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sipbara/controller/user_profile.dart';
import 'package:sipbara/controller/wisata/wisata_controller.dart';
import 'package:sipbara/model/kuliner/kuliner.dart';
import 'package:sipbara/model/penginapan/penginapan.dart';
import 'package:sipbara/model/review/review.dart';
import 'package:sipbara/model/event/event.dart';
import 'package:sipbara/model/wisata/wisata.dart';
import 'package:sipbara/page/dashboard/akomodasi_oleh_oleh_kuliner/dash_kuliner_detail.dart';
import 'package:sipbara/page/dashboard/akomodasi_oleh_oleh_kuliner/dash_penginapan_detail.dart';
import 'package:sipbara/page/dashboard/event/dash_event_detail.dart';
import 'package:sipbara/page/dashboard/wisata/dash_detail_wisata.dart';
import 'package:sipbara/page/menu/event_page/event_page_detail.dart';
import 'package:sipbara/page/menu/event_page/event_page_detail_content.dart';
import 'package:sipbara/page/menu/kuliner/kuliner_page_detail.dart';
import 'package:sipbara/page/menu/penginapan/penginapan_page_detail.dart';
import '../controller/review_controller.dart';
import '../helper/utils.dart';
import '../page/dashboard/review/open_review.dart';
import '../page/menu/wisata/wisata_page_detail.dart';
import '../style/color.dart';

class CardWidget_Small extends StatefulWidget {
  final String imageUrl;
  final String cardLabel;
  final double rating;

  const CardWidget_Small(
      {Key? key,
      required this.imageUrl,
      required this.cardLabel,
      required this.rating})
      : super(key: key);

  @override
  _CardWidget_SmallState createState() => _CardWidget_SmallState();
}

class _CardWidget_SmallState extends State<CardWidget_Small> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 0, 12),
      child: Container(
        width: 270,
        height: 100,
        decoration: BoxDecoration(
          color: SIPColor.secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Color(0x230F1113),
              offset: Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: SIPColor.primaryBackground,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1534445867742-43195f401b6c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8aXRhbHl8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                width: double.infinity,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cardLabel,
                        style: const TextStyle(
                          fontFamily: 'Lexend Deca',
                          fontSize: 16,
                          color: SIPColor.secondaryText,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RatingBarIndicator(
                              itemBuilder: (context, index) => const Icon(
                                Icons.radio_button_checked_rounded,
                                color: SIPColor.primaryText,
                              ),
                              direction: Axis.horizontal,
                              rating: widget.rating,
                              unratedColor: SIPColor.secondaryText,
                              itemCount: 5,
                              itemSize: 16,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 0, 0, 0),
                              child: Text(
                                widget.rating.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  fontSize: 12,
                                  color: SIPColor.secondaryText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget_Large extends StatefulWidget {
  const CardWidget_Large({super.key});

  @override
  State<CardWidget_Large> createState() => _CardWidget_LargeState();
}

class _CardWidget_LargeState extends State<CardWidget_Large> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {},
        child: Container(
          width: 270,
          decoration: BoxDecoration(
            color: SIPColor.secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                color: Color(0x230F1113),
                offset: Offset(0, 4),
              )
            ],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: SIPColor.primaryBackground,
              width: 1,
            ),
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {},
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Hero(
                  tag: 'italyImage',
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1528114039593-4366cc08227d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8aXRhbHl8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Firenze - Giardino Bardini',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                fontSize: 16,
                                color: SIPColor.secondaryText,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 8, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RatingBarIndicator(
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.radio_button_checked_rounded,
                                      color: SIPColor.primaryText,
                                    ),
                                    direction: Axis.horizontal,
                                    rating: 4,
                                    unratedColor: SIPColor.secondaryText,
                                    itemCount: 5,
                                    itemSize: 16,
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      '4.7',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lexend Deca',
                                        color: SIPColor.secondaryText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardDashWisata extends StatefulWidget {
  final String idWisata;
  final String namaWisata;
  final String deskripsi;
  final String thumbnail;
  final Wisata wisata;

  const CardDashWisata({
    super.key,
    required this.namaWisata,
    required this.deskripsi,
    required this.thumbnail,
    required this.idWisata,
    required this.wisata,
  });

  @override
  State<CardDashWisata> createState() => _CardDashWisataState();
}

class _CardDashWisataState extends State<CardDashWisata> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DashDetailWisata(
                  wisata: widget.wisata,
                )));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: SIPColor.secondaryBackground,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: SIPColor.secondaryBackground,
                borderRadius: BorderRadius.circular(0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  widget.thumbnail,
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.namaWisata,
                            style: const TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: SIPColor.primaryText,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 58,
                            decoration: const BoxDecoration(
                              color: SIPColor.secondaryBackground,
                            ),
                            child: Text(
                              widget.deskripsi,
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 14,
                                color: SIPColor.primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddImageCard extends StatefulWidget {
  final String image;
  const AddImageCard({super.key, required this.image});

  @override
  State<AddImageCard> createState() => _AddImageCardState();
}

class _AddImageCardState extends State<AddImageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 8, 8),
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: SIPColor.secondaryBackground,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(widget.image).image,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class ImageCard_Small extends StatefulWidget {
  final File image;
  const ImageCard_Small({super.key, required this.image});

  @override
  State<ImageCard_Small> createState() => _ImageCard_SmallState();
}

class _ImageCard_SmallState extends State<ImageCard_Small> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: SIPColor.secondaryBackground,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(widget.image),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class CardWisataMain extends StatefulWidget {
  final Wisata wisata;
  const CardWisataMain({super.key, required this.wisata});

  @override
  State<CardWisataMain> createState() => _CardWisataMainState();
}

class _CardWisataMainState extends State<CardWisataMain> {
  String desa = '';
  String kecamatan = '';

  @override
  void initState() {
    super.initState();
    fetchPlaceInfo();
  }

  Future<void> fetchPlaceInfo() async {
    final placeInfo = await getPlaceInfo(
        (double.parse(widget.wisata.lat)), double.parse(widget.wisata.long));
    print(placeInfo);
    if (placeInfo != null) {
      setState(() {
        desa = placeInfo['desa'];
        kecamatan = placeInfo['kecamatan'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
      child: GestureDetector(
        onTap: () {
          print('Masuk Detail Wisata');
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailWisata(
                wisata: widget.wisata,
              ),
            ),
          );
        },
        child: Container(
          width: 220,
          height: 240,
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
            border: Border.all(
              color: SIPColor.alternate,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.wisata.thumbnail_image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Text(
                    widget.wisata.nama_wisata,
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: SIPColor.primaryText,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StreamBuilder(
                        stream: readReviews(widget.wisata.id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List reviews = snapshot.data?['reviews'];
                            late double totalRating = 0.0;
                            late double avgRating = 0.0;
                            int banyakReview = reviews.length;
                            if (banyakReview > 0) {
                              for (var data in reviews) {
                                totalRating += data['rating'];
                              }
                              avgRating = totalRating / banyakReview;
                            } else {
                              avgRating = 0.0;
                            }
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 4, 0, 8),
                              child: Row(
                                children: [
                                  RatingBarIndicator(
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star_rounded,
                                      color: SIPColor.warning,
                                    ),
                                    direction: Axis.horizontal,
                                    rating: avgRating,
                                    unratedColor: SIPColor.accent3,
                                    itemCount: 5,
                                    itemSize: 20,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                    child: Text(
                                      '$avgRating',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lexend Deca',
                                        color: SIPColor.secondaryText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return const Center(
                            child: Text('Tidak ada review baru!'),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 8),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '$desa, $kecamatan',
                              style: const TextStyle(),
                            )
                          ],
                          style: const TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 16,
                            color: SIPColor.secondaryText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardCheckReview extends StatefulWidget {
  final Review reviews;
  const CardCheckReview({super.key, required this.reviews});

  @override
  State<CardCheckReview> createState() => _CardCheckReviewState();
}

class _CardCheckReviewState extends State<CardCheckReview> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OpenReviewWidget(
                review: widget.reviews,
              ))),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.96,
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                                future: readProfile(widget.reviews.userUid),
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
                                    return const Text('Nama');
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
                                rating: widget.reviews.rating,
                                unratedColor: const Color(0xFF95A1AC),
                                itemCount: 5,
                                itemSize: 24,
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.chevron_right_outlined,
                              color: SIPColor.secondaryText,
                              size: 24,
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
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FutureBuilder(
                              future: readDetailWisata(widget.reviews.idWisata),
                              builder: (context, snapshot) {
                                print(widget.reviews.idWisata);
                                if (snapshot.hasData) {
                                  final data = snapshot.data!;
                                  return Text(
                                    '${data['namaWisata']}',
                                    style: const TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16,
                                      color: SIPColor.secondaryText,
                                    ),
                                  );
                                } else {
                                  return const Text('Nama Wisata');
                                }
                              }),
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
    );
  }
}

class CardDashEvent extends StatefulWidget {
  final Event event;

  const CardDashEvent({
    super.key,
    required this.event,
  });

  @override
  _CardDashEventState createState() => _CardDashEventState();
}

class _CardDashEventState extends State<CardDashEvent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DashDetailEvent(
                  event: widget.event,
                )));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: SIPColor.secondaryBackground,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: SIPColor.secondaryBackground,
                borderRadius: BorderRadius.circular(0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  widget.event.thumbnail_image,
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.event.nama_event,
                            style: const TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: SIPColor.primaryText,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 58,
                            decoration: const BoxDecoration(
                              color: SIPColor.secondaryBackground,
                            ),
                            child: Text(
                              widget.event.deskripsi_event,
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 14,
                                color: SIPColor.primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardEventMain extends StatefulWidget {
  final Event event;
  const CardEventMain({super.key, required this.event});

  @override
  State<CardEventMain> createState() => _CardEventMainState();
}

class _CardEventMainState extends State<CardEventMain> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailEvent(event: widget.event)));
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
        child: Container(
          width: 220,
          height: 240,
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
            border: Border.all(
              color: SIPColor.alternate,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.network(
                          '${widget.event.thumbnail_image}',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1, 1),
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                            color: SIPColor.secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat("dd")
                                    .format(widget.event.time_start),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Outfit',
                                  fontSize: 32,
                                  color: SIPColor.primaryText,
                                ),
                              ),
                              Text(
                                DateFormat("MMMM")
                                    .format(widget.event.time_start),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Outfit',
                                  color: SIPColor.primaryText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Text(
                    widget.event.nama_event,
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      color: SIPColor.primaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardDashPenginapan extends StatefulWidget {
  final Penginapan penginapan;
  const CardDashPenginapan({super.key, required this.penginapan});

  @override
  State<CardDashPenginapan> createState() => _CardDashPenginapanState();
}

class _CardDashPenginapanState extends State<CardDashPenginapan> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                DashDetailPenginapan(penginapan: widget.penginapan)));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: SIPColor.secondaryBackground,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: SIPColor.secondaryBackground,
                borderRadius: BorderRadius.circular(0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  widget.penginapan.thumbnail_image,
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.penginapan.namaPenginapan,
                            style: const TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: SIPColor.primaryText,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 58,
                            decoration: const BoxDecoration(
                              color: SIPColor.secondaryBackground,
                            ),
                            child: const Text(
                              '',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 14,
                                color: SIPColor.primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardPenginapanMain extends StatefulWidget {
  final Penginapan penginapan;
  const CardPenginapanMain({super.key, required this.penginapan});

  @override
  State<CardPenginapanMain> createState() => _CardPenginapanMainState();
}

class _CardPenginapanMainState extends State<CardPenginapanMain> {
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                DetailPenginapan(penginapan: widget.penginapan)));
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
        child: Container(
          width: double.infinity,
          height: 240,
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
            border: Border.all(
              color: SIPColor.alternate,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.penginapan.thumbnail_image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Text(
                    widget.penginapan.namaPenginapan,
                    style: const TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: SIPColor.primaryText,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 8),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${formatter.format(widget.penginapan.hargaKisaran)}',
                              style: const TextStyle(
                                  color: SIPColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                            const TextSpan(
                              text: ' /malam',
                              style: TextStyle(
                                color: SIPColor.secondaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                          style: const TextStyle(
                            fontFamily: 'Outfit',
                            color: SIPColor.primaryText,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardDashKuliner extends StatefulWidget {
  final Kuliner kuliner;
  const CardDashKuliner({super.key, required this.kuliner});

  @override
  State<CardDashKuliner> createState() => _CardDashKulinerState();
}

class _CardDashKulinerState extends State<CardDashKuliner> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('clicked');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DashDetailKuliner(kuliner: widget.kuliner)));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: SIPColor.secondaryBackground,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: SIPColor.secondaryBackground,
                borderRadius: BorderRadius.circular(0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  widget.kuliner.thumbnail_image,
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.kuliner.namaKuliner,
                            style: const TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: SIPColor.primaryText,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 58,
                            decoration: const BoxDecoration(
                              color: SIPColor.secondaryBackground,
                            ),
                            child: const Text(
                              '',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 14,
                                color: SIPColor.primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardKulinerMain extends StatefulWidget {
  final Kuliner kuliner;
  const CardKulinerMain({super.key, required this.kuliner});

  @override
  State<CardKulinerMain> createState() => _CardKulinerMainState();
}

class _CardKulinerMainState extends State<CardKulinerMain> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailKuliner(kuliner: widget.kuliner)));
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
        child: Container(
          width: double.infinity,
          height: 240,
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
            border: Border.all(
              color: SIPColor.alternate,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.kuliner.thumbnail_image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0x004B39EF), SIPColor.primaryText],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 1),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 0, 0, 16),
                          child: GradientText(
                            widget.kuliner.namaKuliner,
                            style: const TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                            ),
                            colors: const [
                              SIPColor.primaryColor,
                              SIPColor.secondaryColor
                            ],
                            gradientDirection: GradientDirection.ltr,
                            gradientType: GradientType.linear,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
