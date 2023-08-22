import 'package:flutter/material.dart';
import 'package:sipbara/controller/kuliner_controller.dart';
import 'package:sipbara/controller/penginapan_controller.dart';
import 'package:sipbara/model/kuliner/kuliner.dart';
import 'package:sipbara/page/dashboard/akomodasi_oleh_oleh_kuliner/add_kuliner.dart';
import 'package:sipbara/page/dashboard/akomodasi_oleh_oleh_kuliner/add_penginapan.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/card_widget.dart';

import '../../../model/penginapan/penginapan.dart';

class DashAkoKulinerWidget extends StatefulWidget {
  const DashAkoKulinerWidget({Key? key}) : super(key: key);

  @override
  _DashAkoKulinerWidgetState createState() => _DashAkoKulinerWidgetState();
}

class _DashAkoKulinerWidgetState extends State<DashAkoKulinerWidget> {
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: SIPColor.primaryBackground,
        appBar: AppBar(
          backgroundColor: SIPColor.primaryBackground,
          iconTheme: IconThemeData(color: SIPColor.primaryText),
          title: const Text(
            'Data Lain',
            style: TextStyle(
              fontFamily: 'Outfit',
              color: SIPColor.primaryText,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                if (value == MenuItem.penginapan) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddPenginapan()));
                } else if (value == MenuItem.kuliner) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddKuliner()));
                }
              },
              icon: Icon(
                Icons.add_rounded,
                color: SIPColor.secondaryText,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: MenuItem.penginapan,
                  child: Text('Tambah Penginapan'),
                ),
                PopupMenuItem(
                  value: MenuItem.kuliner,
                  child: Text('Tambah Kuliner'),
                ),
              ],
            ),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment(0, 0),
                  child: TabBar(
                    labelColor: SIPColor.primaryText,
                    unselectedLabelColor: SIPColor.secondaryText,
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Readex Pro',
                      color: SIPColor.infoColor,
                    ),
                    indicatorColor: SIPColor.primaryText,
                    tabs: [
                      Tab(
                        text: 'Akomodasi',
                      ),
                      Tab(
                        text: 'Oleh2/Kuliner',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            StreamBuilder(
                              stream: readPenginapan(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  print(snapshot.error);
                                  return const Center(
                                    child: Text('Something went wrong!'),
                                  );
                                } else if (snapshot.hasData) {
                                  final dataPenginapan = snapshot.data!;

                                  return ListView(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    children: dataPenginapan
                                        .map(buildPenginapan)
                                        .toList(),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            StreamBuilder(
                              stream: readKuliner(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  print(snapshot.error);
                                  return const Center(
                                    child: Text('Something went wrong!'),
                                  );
                                } else if (snapshot.hasData) {
                                  final dataKuliner = snapshot.data!;

                                  return ListView(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    children:
                                        dataKuliner.map(buildKuliner).toList(),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ],
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
    );
  }
}

Widget buildPenginapan(Penginapan penginapan) => CardDashPenginapan(
      penginapan: penginapan,
    );

Widget buildKuliner(Kuliner kuliner) => CardDashKuliner(
      kuliner: kuliner,
    );

enum MenuItem {
  penginapan,
  kuliner,
}
