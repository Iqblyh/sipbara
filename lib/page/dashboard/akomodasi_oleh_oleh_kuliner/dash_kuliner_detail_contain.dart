import 'package:flutter/material.dart';
import 'package:sipbara/style/color.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../model/kuliner/kuliner.dart';

class KulinerDetailAdminWidget extends StatefulWidget {
  final Kuliner kuliner;
  const KulinerDetailAdminWidget({Key? key, required this.kuliner})
      : super(key: key);

  @override
  _KulinerDetailAdminWidgetState createState() =>
      _KulinerDetailAdminWidgetState();
}

class _KulinerDetailAdminWidgetState extends State<KulinerDetailAdminWidget> {
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
                  widget.kuliner.thumbnail_image,
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
                    widget.kuliner.namaKuliner,
                    style: const TextStyle(
                      fontSize: 32,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: SIPColor.primaryText,
                    ),
                  ),
                  Text(
                    widget.kuliner.deskripsi,
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
          ],
        );
      }),
    );
  }
}
