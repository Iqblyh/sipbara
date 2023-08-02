import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/storage_service.dart';
import 'package:sipbara/page/dashboard/wisata/add_image_modal.dart';
import 'package:sipbara/style/color.dart';

import '../../../controller/wisata/wisata_controller.dart';
import '../../../model/wisata/wisata.dart';

class WisataDetailAdminWidget extends StatefulWidget {
  final Wisata dataWisata;
  const WisataDetailAdminWidget({Key? key, required this.dataWisata})
      : super(key: key);

  @override
  _WisataDetailAdminWidgetState createState() =>
      _WisataDetailAdminWidgetState();
}

class _WisataDetailAdminWidgetState extends State<WisataDetailAdminWidget> {
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
    return SingleChildScrollView(
      child: Builder(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.dataWisata.thumbnail_image,
                  width: MediaQuery.sizeOf(context).width,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dataWisata.nama_wisata,
                    style: const TextStyle(
                      fontSize: 32,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: SIPColor.primaryText,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                    child: Text(
                      'Desa, Kecamatan',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 18,
                        color: SIPColor.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    widget.dataWisata.deskripsi_wisata,
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
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Media',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Readex Pro',
                              color: SIPColor.secondaryText,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    final subPath = widget
                                        .dataWisata.nama_wisata
                                        .toLowerCase()
                                        .replaceAll(' ', '_');
                                    final idWisata = widget.dataWisata.id;
                                    return AddImageModal(
                                      idWisata: idWisata,
                                      subPath: subPath,
                                    );
                                  });
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
                                  'Tambah Media',
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
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: const BoxDecoration(),
                      child: StreamBuilder(
                          stream: readMedias(widget.dataWisata.id),
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
                                itemBuilder: (BuildContext context, int index) {
                                  var image = images[index];
                                  if (images.isEmpty) {
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
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Container(
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: SIPColor
                                                    .secondaryBackground,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    '${image['imageUrl']}',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(1, -1),
                                              child: InkWell(
                                                onTap: () {
                                                  QuickAlert.show(
                                                      context: context,
                                                      type:
                                                          QuickAlertType.error,
                                                      title: 'Peringatan',
                                                      text:
                                                          'Anda yakin ingin menghapus gambar',
                                                      confirmBtnText: 'Ya',
                                                      confirmBtnColor:
                                                          SIPColor.error,
                                                      cancelBtnText: 'Tidak',
                                                      showCancelBtn: true,
                                                      onConfirmBtnTap:
                                                          () async {
                                                        DocumentReference
                                                            docRef =
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'wisata')
                                                                .doc(widget
                                                                    .dataWisata
                                                                    .id);
                                                        DocumentSnapshot doc =
                                                            await docRef.get();
                                                        List images =
                                                            doc.get('images');
                                                        print(images);
                                                        docRef.update({
                                                          'images': FieldValue
                                                              .arrayRemove([
                                                            images[index]
                                                          ])
                                                        }).whenComplete(
                                                            () async {
                                                          final idWisata =
                                                              widget.dataWisata
                                                                  .id;
                                                          final subPath = widget
                                                              .dataWisata
                                                              .nama_wisata
                                                              .toLowerCase()
                                                              .replaceAll(
                                                                  ' ', '_');

                                                          await Storage()
                                                              .deleteImage(
                                                                  idWisata,
                                                                  subPath,
                                                                  image[
                                                                      'imageName']);
                                                        });
                                                        print(
                                                            image['imageName']);
                                                        await QuickAlert.show(
                                                          context: context,
                                                          type: QuickAlertType
                                                              .success,
                                                          text:
                                                              'Gambar berhasil dihapus',
                                                        );
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                },
                                                child: const Icon(
                                                  Icons.cancel_rounded,
                                                  color: SIPColor.error,
                                                ),
                                              ),
                                            ),
                                          ],
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
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              );
                            }
                          }),
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
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Reviews',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Readex Pro',
                                  color: SIPColor.primaryText,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 4),
                                    child: RatingBarIndicator(
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star_rounded,
                                        color: SIPColor.warning,
                                      ),
                                      direction: Axis.horizontal,
                                      rating: 5,
                                      unratedColor: const Color(0xFF95A1AC),
                                      itemCount: 5,
                                      itemSize: 16,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Text(
                                      '4.7',
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14,
                                        color: SIPColor.secondaryText,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 0),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      2, 2, 2, 2),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16, 12, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      'Iqbal Yoga Hutama',
                                                      style: TextStyle(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: SIPColor
                                                            .primaryText,
                                                      )),
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
                                                      rating: 5,
                                                      unratedColor: const Color(
                                                          0xFF95A1AC),
                                                      itemCount: 5,
                                                      itemSize: 24,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color: SIPColor.alternate,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(2, 2, 2, 2),
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/candi1.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 4, 16, 12),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                                  style: TextStyle(
                                                    color:
                                                        SIPColor.secondaryText,
                                                    fontFamily: 'Readex Pro',
                                                    fontSize: 14,
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
                            ),
                          ]),
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
    );
  }
}
