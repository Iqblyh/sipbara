import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/model/wisata/wisata.dart';
import 'package:sipbara/page/dashboard/wisata/edit_wisata.dart';

import '../../../controller/wisata/wisata_controller.dart';
import '../../../style/color.dart';
import 'dash_detail_wisata_content.dart';

class DashDetailWisata extends StatefulWidget {
  final Wisata wisata;

  DashDetailWisata({super.key, required this.wisata});

  @override
  State<DashDetailWisata> createState() => _DashDetailWisataState();
}

class _DashDetailWisataState extends State<DashDetailWisata> {
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
          final wisata = snapshot.data!;
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                EditWisataWidget(wisata: widget.wisata)));
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
                            final String subPath = widget.wisata.nama_wisata
                                .toLowerCase()
                                .replaceAll(' ', '_');
                            if (kDebugMode) {
                              print('HAHAHAHAH HAHAHAHAH HHAHAH : $subPath');
                            }
                            await deleteWisata(
                              widget.wisata.id,
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
              body: builDetailWisata(
                Wisata(
                  id: wisata['idWisata'],
                  nama_wisata: wisata['namaWisata'],
                  deskripsi_wisata: wisata['deskripsiWisata'],
                  thumbnail_image: wisata['thumbnail'],
                  lat: wisata['lat'],
                  long: wisata['long'],
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

Widget builDetailWisata(Wisata wisata) => WisataDetailAdminWidget(
      dataWisata: wisata,
    );
