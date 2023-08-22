import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/review_controller.dart';
import 'package:sipbara/controller/user_profile.dart';
import 'package:sipbara/helper/utils.dart';
import 'package:sipbara/page/menu/profile/add_profile.dart';
import 'package:sipbara/page/review/add_review.dart';

import '../../../controller/auth.dart';
import '../../../controller/wisata/wisata_controller.dart';
import '../../../model/wisata/wisata.dart';
import '../../../style/color.dart';

class DetailWisata extends StatefulWidget {
  final Wisata wisata;
  DetailWisata({super.key, required this.wisata});

  @override
  State<DetailWisata> createState() => _DetailWisataState();
}

class _DetailWisataState extends State<DetailWisata> {
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
    return FutureBuilder(
      future: readDetailWisata(widget.wisata.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        } else if (snapshot.hasData) {
          final dataWisata = snapshot.data!;
          return Scaffold(
            backgroundColor: SIPColor.primaryBackground,
            appBar: AppBar(
              backgroundColor: SIPColor.primaryBackground,
              iconTheme: const IconThemeData(color: SIPColor.primaryText),
              title: const Text(
                'Detail Wisata',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: SIPColor.primaryText,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: () {
                      MapUtils.openMap(double.parse(widget.wisata.lat),
                          double.parse(widget.wisata.long));
                    },
                    child: const Icon(
                      Icons.location_on_rounded,
                      color: SIPColor.success,
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Builder(builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          dataWisata['thumbnail'],
                          width: MediaQuery.sizeOf(context).width,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataWisata['namaWisata'],
                            style: const TextStyle(
                              fontSize: 32,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                              color: SIPColor.primaryText,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 8, 0, 8),
                            child: Text(
                              '$desa, $kecamatan',
                              style: const TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 18,
                                color: SIPColor.primaryColor,
                              ),
                            ),
                          ),
                          Text(
                            dataWisata['deskripsiWisata'],
                            style: const TextStyle(
                              fontFamily: 'Readex Pro',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: SIPColor.secondaryText,
                            ),
                          ),
                          const Divider(
                            height: 32,
                            thickness: 1,
                            color: SIPColor.alternate,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Media',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Readex Pro',
                                      color: SIPColor.secondaryText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 100,
                              decoration: const BoxDecoration(),
                              child: StreamBuilder(
                                  stream: readMedias(widget.wisata.id),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return const Center(
                                        child: Text('Something went wrong :('),
                                      );
                                    } else if (snapshot.hasData) {
                                      List images = snapshot.data?['images'];
                                      print(images.isEmpty);
                                      return ListView.builder(
                                        itemCount: images.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var image = images[index];
                                          if (images.isEmpty) {
                                            return Container(
                                              width: 80,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: SIPColor
                                                    .secondaryBackground,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/add_image.png',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            );
                                          } else {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8),
                                              child: GestureDetector(
                                                onTap: () {
                                                  _showImagePreviewDialog(
                                                    List<String>.from(
                                                        images.map((image) =>
                                                            image['imageUrl'])),
                                                    index,
                                                  );
                                                },
                                                child: Container(
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: 80,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: SIPColor
                                                              .secondaryBackground,
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                Image.network(
                                                              '${image['imageUrl']}',
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    } else {
                                      return Container(
                                        width: 80,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: SIPColor.secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/add_image.png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      );
                                    }
                                  }),
                              // child: ListView(
                              //   scrollDirection: Axis.horizontal,
                              //   children: [
                              //     Container(
                              //       width: 80,
                              //       height: 100,
                              //       decoration: BoxDecoration(
                              //         color: SIPColor.secondaryBackground,
                              //         image: DecorationImage(
                              //           fit: BoxFit.cover,
                              //           image: Image.asset(
                              //             'assets/images/candi.png',
                              //           ).image,
                              //         ),
                              //         borderRadius: BorderRadius.circular(8),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ),
                            const Divider(
                              height: 32,
                              thickness: 1,
                              color: SIPColor.alternate,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  StreamBuilder(
                                      stream: readReviews(widget.wisata.id),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          List reviews =
                                              snapshot.data?['reviews'];
                                          late double totalRating = 0.0;
                                          late double avgRating = 0.0;
                                          int banyakReview = reviews.length;
                                          if (banyakReview > 0) {
                                            for (var data in reviews) {
                                              totalRating += data['rating'];
                                            }
                                            avgRating =
                                                totalRating / banyakReview;
                                          }
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Reviews',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          SIPColor.primaryText,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                            0, 4, 0, 4),
                                                    child: RatingBarIndicator(
                                                      itemBuilder:
                                                          (context, index) =>
                                                              const Icon(
                                                        Icons.star_rounded,
                                                        color: SIPColor.warning,
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      rating: avgRating,
                                                      unratedColor: const Color(
                                                          0xFF95A1AC),
                                                      itemCount: 5,
                                                      itemSize: 16,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                            4, 0, 0, 0),
                                                    child: Text(
                                                      '$avgRating',
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 14,
                                                        color: SIPColor
                                                            .secondaryText,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        }
                                        return Container();
                                      }),
                                  InkWell(
                                    onTap: () async {
                                      bool profileAdded = await isFieldEmpty();
                                      print(profileAdded);

                                      if (profileAdded != false) {
                                        QuickAlert.show(
                                            context: context,
                                            type: QuickAlertType.info,
                                            title: 'Belum menambahkan profil',
                                            text:
                                                'Tambah profil untuk melanjutkan!',
                                            confirmBtnText: 'Tambah profil',
                                            confirmBtnColor: SIPColor.success,
                                            confirmBtnTextStyle:
                                                const TextStyle(
                                              fontFamily: 'Outfit',
                                              fontSize: 16,
                                              color:
                                                  SIPColor.secondaryBackground,
                                            ),
                                            onConfirmBtnTap: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ProfilecreateWidget(),
                                                ),
                                              );
                                            });
                                      } else {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddReviewWidget(
                                                      idWisata:
                                                          widget.wisata.id,
                                                    )));
                                      }
                                    },
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: SIPColor.secondaryColor,
                                          size: 16,
                                        ),
                                        Text(
                                          'Tambah Review',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Readex Pro',
                                            color: SIPColor.secondaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              StreamBuilder(
                                stream: readReviews(widget.wisata.id),
                                builder: (contex, snapshot) {
                                  if (snapshot.hasError) {
                                    return const Center(
                                      child: Text('Something went wrong!'),
                                    );
                                  } else if (snapshot.hasData) {
                                    List reviews = snapshot.data?['reviews'];
                                    return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: reviews.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var review = reviews[index];
                                        if (reviews.isEmpty) {
                                          return const Row(
                                            children: [Text('Review kosong!')],
                                          );
                                        } else {
                                          double rate = review['rating'] + .0;
                                          return FutureBuilder(
                                              future:
                                                  readProfile(review['userId']),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  final profile =
                                                      snapshot.data!;
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 16),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.96,
                                                      decoration: BoxDecoration(
                                                        color: SIPColor
                                                            .secondaryBackground,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4,
                                                            color: Color(
                                                                0x33000000),
                                                            offset:
                                                                Offset(0, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                2, 2, 2, 2),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                      16,
                                                                      12,
                                                                      16,
                                                                      0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        profile[
                                                                            'name'],
                                                                        style:
                                                                            const TextStyle(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          fontSize:
                                                                              22,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              SIPColor.primaryText,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            4),
                                                                        child:
                                                                            RatingBarIndicator(
                                                                          itemBuilder: (context, index) =>
                                                                              const Icon(
                                                                            Icons.star_rounded,
                                                                            color:
                                                                                SIPColor.warning,
                                                                          ),
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          rating:
                                                                              rate,
                                                                          unratedColor:
                                                                              const Color(0xFF95A1AC),
                                                                          itemCount:
                                                                              5,
                                                                          itemSize:
                                                                              24,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Card(
                                                                    clipBehavior:
                                                                        Clip.antiAliasWithSaveLayer,
                                                                    color: SIPColor
                                                                        .alternate,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsetsDirectional.fromSTEB(
                                                                              2,
                                                                              2,
                                                                              2,
                                                                              2),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          profile[
                                                                              'imageUrl'],
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                      16,
                                                                      4,
                                                                      16,
                                                                      12),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      review[
                                                                          'review'],
                                                                      style:
                                                                          const TextStyle(
                                                                        color: SIPColor
                                                                            .secondaryText,
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            14,
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
                                                  );
                                                } else {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }
                                              });
                                        }
                                      },
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                              const Divider(
                                height: 32,
                                thickness: 1,
                                color: SIPColor.alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void _showImagePreviewDialog(List<String> imageUrls, int initialIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            height: 300,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: imageUrls.length,
                    controller: PageController(initialPage: initialIndex),
                    itemBuilder: (context, index) {
                      return Center(
                        child: Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: SIPColor.secondaryBackground,
                      ),
                      onPressed: () {
                        int newIndex = initialIndex - 1;
                        if (newIndex < 0) newIndex = imageUrls.length - 1;
                        Navigator.pop(context);
                        _showImagePreviewDialog(imageUrls, newIndex);
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: SIPColor.secondaryBackground,
                      ),
                      onPressed: () {
                        int newIndex = initialIndex + 1;
                        if (newIndex >= imageUrls.length) newIndex = 0;
                        Navigator.pop(context);
                        _showImagePreviewDialog(imageUrls, newIndex);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
