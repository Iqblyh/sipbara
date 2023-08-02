import 'package:flutter/material.dart';
import 'package:sipbara/controller/wisata/wisata_controller.dart';
import 'package:sipbara/model/wisata/wisata.dart';
import 'package:sipbara/page/dashboard/wisata/add_wisata.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/card_widget.dart';

class DashWisataWidget extends StatefulWidget {
  const DashWisataWidget({Key? key}) : super(key: key);

  @override
  _DashWisataWidgetState createState() => _DashWisataWidgetState();
}

class _DashWisataWidgetState extends State<DashWisataWidget> {
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
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: SIPColor.primaryBackground,
        appBar: AppBar(
          backgroundColor: SIPColor.primaryBackground,
          iconTheme: const IconThemeData(color: SIPColor.primaryText),
          title: const Text(
            'Data Wisata',
            style: TextStyle(
              fontFamily: 'Outfit',
              color: SIPColor.primaryText,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddWisataWidget()));
                },
                child: const Icon(
                  Icons.add,
                  color: SIPColor.secondaryText,
                  size: 24,
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
                  child: TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Label here...',
                      labelStyle: const TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 14,
                        color: SIPColor.secondaryText,
                      ),
                      hintStyle: const TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 14,
                        color: SIPColor.secondaryText,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: SIPColor.alternate,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: SIPColor.primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: SIPColor.error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(
                          color: SIPColor.error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Reade Pro',
                      fontSize: 14,
                      color: SIPColor.primaryText,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: size.height,
                      child: StreamBuilder(
                        stream: readWisata(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text('Something went wrong!'),
                            );
                          } else if (snapshot.hasData) {
                            final dataWisata = snapshot.data!;

                            return ListView(
                              children: dataWisata.map(buildWisata).toList(),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWisata(Wisata wisata) => CardDashWisata(
        namaWisata: wisata.nama_wisata,
        deskripsi: wisata.deskripsi_wisata,
        thumbnail: wisata.thumbnail_image,
        idWisata: wisata.id,
        wisata: wisata,
      );
}
