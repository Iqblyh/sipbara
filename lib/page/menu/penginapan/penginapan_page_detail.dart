import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/event_controller.dart';
import 'package:sipbara/controller/penginapan_controller.dart';
import 'package:sipbara/model/event/event.dart';
import 'package:sipbara/model/penginapan/penginapan.dart';
import 'package:sipbara/page/dashboard/event/dash_event_detail_content.dart';
import 'package:sipbara/page/dashboard/event/edit_event.dart';
import 'package:sipbara/page/menu/event_page/event_page_detail_content.dart';
import 'package:sipbara/page/menu/penginapan/penginapan_page_detail_content.dart';

import '../../../style/color.dart';

class DetailPenginapan extends StatefulWidget {
  final Penginapan penginapan;

  DetailPenginapan({super.key, required this.penginapan});

  @override
  State<DetailPenginapan> createState() => _DetailPenginapanState();
}

class _DetailPenginapanState extends State<DetailPenginapan> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readDetailPenginapan(widget.penginapan.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        } else if (snapshot.hasData) {
          final penginapan = snapshot.data!;
          return Scaffold(
              backgroundColor: SIPColor.primaryBackground,
              appBar: AppBar(
                backgroundColor: SIPColor.primaryBackground,
                iconTheme: const IconThemeData(color: SIPColor.primaryText),
                title: const Text(
                  'Detail Penginapan',
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
              body: buildDetailPenginapanMain(
                Penginapan(
                  id: penginapan['idPenginapan'],
                  namaPenginapan: penginapan['nama_penginapan'],
                  deskripsi: penginapan['deskripsi_penginapan'],
                  hargaKisaran:
                      double.parse((penginapan['harga_kisaran']).toString()),
                  contact: penginapan['contact'],
                  thumbnail_image: penginapan['thumbnail'],
                ),
              ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

Widget buildDetailPenginapanMain(Penginapan penginapan) =>
    PenginapanDetailWidget(
      penginapan: penginapan,
    );
