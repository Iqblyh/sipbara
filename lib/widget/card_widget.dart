import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sipbara/model/wisata/wisata.dart';
import 'package:sipbara/page/dashboard/wisata/dash_detail_wisata.dart';
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
      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 12),
      child: Container(
        width: 270,
        height: 100,
        decoration: BoxDecoration(
          color: SIPColor.secondaryBackground,
          boxShadow: [
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
              borderRadius: BorderRadius.only(
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
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
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
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          fontSize: 16,
                          color: SIPColor.secondaryText,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RatingBarIndicator(
                              itemBuilder: (context, index) => Icon(
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                widget.rating.toString(),
                                style: TextStyle(
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
      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
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
            boxShadow: [
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
                    borderRadius: BorderRadius.only(
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
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Firenze - Giardino Bardini',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                fontSize: 16,
                                color: SIPColor.secondaryText,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RatingBarIndicator(
                                    itemBuilder: (context, index) => Icon(
                                      Icons.radio_button_checked_rounded,
                                      color: SIPColor.primaryText,
                                    ),
                                    direction: Axis.horizontal,
                                    rating: 4,
                                    unratedColor: SIPColor.secondaryText,
                                    itemCount: 5,
                                    itemSize: 16,
                                  ),
                                  Padding(
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
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
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
  AddImageCard({super.key, required this.image});

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
  ImageCard_Small({super.key, required this.image});

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
