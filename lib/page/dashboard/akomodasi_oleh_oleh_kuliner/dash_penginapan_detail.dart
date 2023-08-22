import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/event_controller.dart';
import 'package:sipbara/controller/penginapan_controller.dart';
import 'package:sipbara/model/event/event.dart';
import 'package:sipbara/model/penginapan/penginapan.dart';
import 'package:sipbara/page/dashboard/akomodasi_oleh_oleh_kuliner/dash_penginapan_detail_content.dart';
import 'package:sipbara/page/dashboard/akomodasi_oleh_oleh_kuliner/edit_penginapan.dart';
import 'package:sipbara/page/dashboard/event/dash_event_detail_content.dart';
import 'package:sipbara/page/dashboard/event/edit_event.dart';

import '../../../style/color.dart';

class DashDetailPenginapan extends StatefulWidget {
  final Penginapan penginapan;

  DashDetailPenginapan({super.key, required this.penginapan});

  @override
  State<DashDetailPenginapan> createState() => _DashDetailPenginapanState();
}

class _DashDetailPenginapanState extends State<DashDetailPenginapan> {
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
                actions: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditPenginapanWidget(
                                penginapan: widget.penginapan)));
                      },
                      child: Icon(
                        Icons.edit_rounded,
                        color: SIPColor.secondaryColor,
                        size: 24,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Hapus Data?',
                          text: 'Apakah anda ingin menghapus data?',
                          onConfirmBtnTap: () async {
                            final String subPath = widget
                                .penginapan.namaPenginapan
                                .toLowerCase()
                                .replaceAll(' ', '_');
                            await deletePenginapan(
                              widget.penginapan.id,
                              subPath,
                            );
                            int count = 0;
                            Navigator.of(context).popUntil((_) => count++ >= 2);

                            await QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: 'Data berhasil dihapus',
                            );
                          });
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      child: Icon(
                        Icons.delete_rounded,
                        color: SIPColor.error,
                        size: 24,
                      ),
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0,
              ),
              body: builDetailPenginapan(
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

Widget builDetailPenginapan(Penginapan penginapan) =>
    PenginapanDetailAdminWidget(
      penginapan: penginapan,
    );
