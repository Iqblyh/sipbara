import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/event_controller.dart';
import 'package:sipbara/controller/kuliner_controller.dart';
import 'package:sipbara/controller/penginapan_controller.dart';
import 'package:sipbara/model/event/event.dart';
import 'package:sipbara/model/kuliner/kuliner.dart';
import 'package:sipbara/model/penginapan/penginapan.dart';
import 'package:sipbara/page/dashboard/akomodasi_oleh_oleh_kuliner/dash_penginapan_detail_content.dart';
import 'package:sipbara/page/dashboard/akomodasi_oleh_oleh_kuliner/edit_kuliner.dart';
import 'package:sipbara/page/dashboard/akomodasi_oleh_oleh_kuliner/edit_penginapan.dart';
import 'package:sipbara/page/dashboard/event/dash_event_detail_content.dart';
import 'package:sipbara/page/dashboard/event/edit_event.dart';

import '../../../style/color.dart';
import 'dash_kuliner_detail_contain.dart';

class DashDetailKuliner extends StatefulWidget {
  final Kuliner kuliner;

  DashDetailKuliner({super.key, required this.kuliner});

  @override
  State<DashDetailKuliner> createState() => _DashDetailKulinerState();
}

class _DashDetailKulinerState extends State<DashDetailKuliner> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readDetailKuliner(widget.kuliner.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        } else if (snapshot.hasData) {
          final kuliner = snapshot.data!;
          return Scaffold(
              backgroundColor: SIPColor.primaryBackground,
              appBar: AppBar(
                backgroundColor: SIPColor.primaryBackground,
                iconTheme: const IconThemeData(color: SIPColor.primaryText),
                title: const Text(
                  'Detail Kuliner',
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
                            builder: (context) =>
                                EditKulinerWidget(kuliner: widget.kuliner)));
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
                            final String subPath = widget.kuliner.namaKuliner
                                .toLowerCase()
                                .replaceAll(' ', '_');
                            await deleteKuliner(
                              widget.kuliner.id,
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
              body: builDetailKuliner(
                Kuliner(
                  id: kuliner['idKuliner'],
                  namaKuliner: kuliner['nama'],
                  deskripsi: kuliner['deskripsi'],
                  thumbnail_image: kuliner['thumbnail'],
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

Widget builDetailKuliner(Kuliner kuliner) => KulinerDetailAdminWidget(
      kuliner: kuliner,
    );
