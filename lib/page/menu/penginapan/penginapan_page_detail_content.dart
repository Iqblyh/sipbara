import 'package:flutter/material.dart';
import 'package:sipbara/controller/penginapan_controller.dart';

import 'package:sipbara/model/penginapan/penginapan.dart';

import 'package:sipbara/style/color.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class PenginapanDetailWidget extends StatefulWidget {
  final Penginapan penginapan;
  const PenginapanDetailWidget({Key? key, required this.penginapan})
      : super(key: key);

  @override
  _PenginapanDetailWidgetState createState() => _PenginapanDetailWidgetState();
}

class _PenginapanDetailWidgetState extends State<PenginapanDetailWidget> {
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                    child: Text(
                      '${formatter.format(widget.penginapan.hargaKisaran)}/malam',
                      style: TextStyle(
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
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
