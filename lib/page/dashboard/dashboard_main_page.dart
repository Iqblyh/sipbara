import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sipbara/controller/event_controller.dart';
import 'package:sipbara/controller/kuliner_controller.dart';
import 'package:sipbara/controller/penginapan_controller.dart';
import 'package:sipbara/controller/wisata/wisata_controller.dart';
import 'package:sipbara/page/dashboard/akomodasi_oleh_oleh_kuliner/dash_ako_kuliner.dart';
import 'package:sipbara/page/dashboard/event/dash_event.dart';
import 'package:sipbara/page/dashboard/review/check_review.dart';
import 'package:sipbara/page/dashboard/wisata/dash_wsiata.dart';
import 'package:sipbara/style/color.dart';

class DashboardMainPage extends StatefulWidget {
  const DashboardMainPage({super.key});

  @override
  State<DashboardMainPage> createState() => _DashboardMainPageState();
}

class _DashboardMainPageState extends State<DashboardMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SIPColor.primaryBackground,
      appBar: AppBar(
        backgroundColor: SIPColor.primaryBackground,
        iconTheme: const IconThemeData(color: SIPColor.primaryText),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: SIPColor.primaryText,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CheckReviewWidget())),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: SIPColor.secondaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24, 24, 24, 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 12),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('review')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    List unviewedReview = [];
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator(); // Show a loading indicator while data is being fetched.
                                    }

                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }

                                    if (!snapshot.hasData ||
                                        snapshot.data!.docs.isEmpty) {
                                      return const Text(
                                        '0',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 42,
                                          fontFamily: 'Readex Pro',
                                          color: SIPColor.secondaryBackground,
                                        ),
                                      );
                                    }

                                    for (int i = 0;
                                        i < snapshot.data!.docs.length;
                                        i++) {
                                      var document = snapshot.data!.docs[i];
                                      // Access fields using document['fieldName']
                                      List reviews = document['reviews'];

                                      for (int i = 0; i < reviews.length; i++) {
                                        if (reviews[i]['isViewed'] == false) {
                                          unviewedReview.add(reviews[i]);
                                        }
                                      }
                                    }

                                    int newReview = unviewedReview.length;
                                    // Process and display your data here
                                    return Text(
                                      '$newReview',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 42,
                                        fontFamily: 'Readex Pro',
                                        color: SIPColor.secondaryBackground,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const Text(
                                'Review\nTerbaru',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  fontFamily: 'Readex Pro',
                                  color: SIPColor.secondaryBackground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                          fontFamily: 'Outfit',
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: SIPColor.primaryText),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DashWisataWidget()));
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: SIPColor.secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 12, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 12, 12, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Data Wisata',
                                                style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        SIPColor.primaryText),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  'Lihat data wisata',
                                                  style: TextStyle(
                                                      fontFamily: 'Outfit',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: SIPColor
                                                          .secondaryText),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: SIPColor.secondaryText,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16, 12, 0, 12),
                                          child: StreamBuilder(
                                              stream: readWisata(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  final wisata = snapshot.data!;
                                                  final wisataCount =
                                                      wisata.length;
                                                  print(
                                                      'Jumlah WIsata : $wisataCount');
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '$wisataCount',
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 36,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: SIPColor
                                                                .primaryText),
                                                      ),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          'Total Wisata dimasukan',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Outfit',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: SIPColor
                                                                  .secondaryText),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return const Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '0',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            fontSize: 36,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: SIPColor
                                                                .primaryText),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          'Total Wisata dimasukan',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Outfit',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: SIPColor
                                                                  .secondaryText),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }
                                              }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const DashEventWidget()));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: SIPColor.secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x33000000),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 12, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 12, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Data Event',
                                              style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                  color: SIPColor.primaryText),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                'Lihat data event',
                                                style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        SIPColor.secondaryText),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        color: SIPColor.secondaryText,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 12, 0, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            StreamBuilder(
                                                stream: readEventActive(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    final dataActive =
                                                        snapshot.data!;
                                                    return StreamBuilder(
                                                        stream: readEvent(),
                                                        builder: (context,
                                                            snapshot2) {
                                                          if (snapshot2
                                                              .hasData) {
                                                            final data =
                                                                snapshot2.data!;
                                                            return Text(
                                                              '${dataActive.length}/${data.length}',
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize: 36,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: SIPColor
                                                                      .primaryText),
                                                            );
                                                          } else {
                                                            return Text(
                                                              '${dataActive.length}/0',
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize: 36,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: SIPColor
                                                                      .primaryText),
                                                            );
                                                          }
                                                        });
                                                  } else {
                                                    return StreamBuilder(
                                                        stream: readEvent(),
                                                        builder: (context,
                                                            snapshot3) {
                                                          if (snapshot3
                                                              .hasData) {
                                                            final data =
                                                                snapshot3.data!;
                                                            return Text(
                                                              '0/${data.length}',
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize: 36,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: SIPColor
                                                                      .primaryText),
                                                            );
                                                          } else {
                                                            return const Text(
                                                              '0/0',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize: 36,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: SIPColor
                                                                      .primaryText),
                                                            );
                                                          }
                                                        });
                                                  }
                                                }),
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                'Event aktif',
                                                style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        SIPColor.secondaryText),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DashAkoKulinerWidget())),
                    child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: SIPColor.secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x33000000),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 12, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 12, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Data Lain',
                                              style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                  color: SIPColor.primaryText),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                'Lihat data lain',
                                                style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        SIPColor.secondaryText),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right_rounded,
                                        color: SIPColor.secondaryText,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 12, 0, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            StreamBuilder(
                                                stream: readPenginapan(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    final data = snapshot.data!;
                                                    return Text(
                                                      '${data.length}',
                                                      style: const TextStyle(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: SIPColor
                                                              .primaryText),
                                                    );
                                                  } else {
                                                    return const Text(
                                                      '0',
                                                      style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: SIPColor
                                                              .primaryText),
                                                    );
                                                  }
                                                }),
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                'Total penginapan',
                                                style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        SIPColor.secondaryText),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 16, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            StreamBuilder(
                                                stream: readKuliner(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData) {
                                                    final data = snapshot.data!;
                                                    return Text(
                                                      '${data.length}',
                                                      style: const TextStyle(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: SIPColor
                                                              .primaryText),
                                                    );
                                                  } else {
                                                    return const Text(
                                                      '0',
                                                      style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: SIPColor
                                                              .primaryText),
                                                    );
                                                  }
                                                }),
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                'Total kuliner',
                                                style: TextStyle(
                                                    fontFamily: 'Outfit',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        SIPColor.secondaryText),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
