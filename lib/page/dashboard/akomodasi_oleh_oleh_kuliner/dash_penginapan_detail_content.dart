import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/penginapan_controller.dart';
import 'package:sipbara/controller/storage_service.dart';
import 'package:sipbara/model/penginapan/penginapan.dart';
import 'package:sipbara/page/dashboard/akomodasi_oleh_oleh_kuliner/add_image_modal_penginapan.dart';
import 'package:sipbara/page/dashboard/event/add_image_modal_event.dart';
import 'package:sipbara/style/color.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class PenginapanDetailAdminWidget extends StatefulWidget {
  final Penginapan penginapan;
  const PenginapanDetailAdminWidget({Key? key, required this.penginapan})
      : super(key: key);

  @override
  _PenginapanDetailAdminWidgetState createState() =>
      _PenginapanDetailAdminWidgetState();
}

class _PenginapanDetailAdminWidgetState
    extends State<PenginapanDetailAdminWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
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
                  widget.penginapan.thumbnail_image,
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
                    widget.penginapan.namaPenginapan,
                    style: const TextStyle(
                      fontSize: 32,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: SIPColor.primaryText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                    child: Text(
                      '${formatter.format(widget.penginapan.hargaKisaran)}/malam*',
                      style: const TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 18,
                        color: SIPColor.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    widget.penginapan.deskripsi,
                    style: const TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: SIPColor.secondaryText,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      '*Harga belum tentu sesuai',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: SIPColor.secondaryText,
                      ),
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
                                        .penginapan.namaPenginapan
                                        .toLowerCase()
                                        .replaceAll(' ', '_');
                                    final idPenginapan = widget.penginapan.id;
                                    return AddImageModalPenginapan(
                                      idPenginapan: idPenginapan,
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
                          stream: readMedias(widget.penginapan.id),
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
                                                  const AlignmentDirectional(
                                                      1, -1),
                                              child: InkWell(
                                                onTap: () {
                                                  QuickAlert.show(
                                                      context: context,
                                                      type:
                                                          QuickAlertType.error,
                                                      title: 'Peringatan',
                                                      text:
                                                          'Anda yakin ingin menghapus gambar',
                                                      confirmBtnText: 'Tidak',
                                                      confirmBtnColor:
                                                          SIPColor.error,
                                                      cancelBtnText: 'Ya',
                                                      showCancelBtn: true,
                                                      onCancelBtnTap: () async {
                                                        DocumentReference docRef =
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'penginapan')
                                                                .doc(widget
                                                                    .penginapan
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
                                                          final idEvent = widget
                                                              .penginapan.id;
                                                          final subPath = widget
                                                              .penginapan
                                                              .namaPenginapan
                                                              .toLowerCase()
                                                              .replaceAll(
                                                                  ' ', '_');

                                                          await Storage()
                                                              .deleteImage(
                                                                  idEvent,
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
                                                          confirmBtnColor:
                                                              SIPColor.success,
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
                                'Kontak',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Readex Pro',
                                  color: SIPColor.primaryText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.contact_phone_rounded,
                                      color: SIPColor.success,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        '${widget.penginapan.contact}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Readex Pro',
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
