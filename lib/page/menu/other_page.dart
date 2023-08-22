import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sipbara/controller/kuliner_controller.dart';
import 'package:sipbara/controller/penginapan_controller.dart';
import 'package:sipbara/model/penginapan/penginapan.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/card_widget.dart';

import '../../model/kuliner/kuliner.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  TextEditingController _searchController = TextEditingController();
  List<Penginapan> filteredPenginapanList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SIPColor.primaryBackground,
      appBar: AppBar(
        backgroundColor: SIPColor.primaryBackground,
        automaticallyImplyLeading: false,
        title: const Text(
          'Lain - lain',
          style: TextStyle(
            fontSize: 22,
            color: SIPColor.primaryText,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 22, 0, 0),
          child: DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                const Align(
                  alignment: Alignment(0, 0),
                  child: TabBar(
                    labelColor: SIPColor.primaryText,
                    labelStyle: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    indicatorColor: SIPColor.secondaryText,
                    tabs: [
                      Tab(
                        text: 'Penginapan',
                      ),
                      Tab(
                        text: 'Oleh-oleh & Kuliner',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 8, 16, 12),
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: SIPColor.secondaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: Color(0x33000000),
                                      offset: Offset(0, 1),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: SIPColor.alternate,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 8, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Icon(
                                        Icons.search_rounded,
                                        color: SIPColor.secondaryText,
                                        size: 24,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(4, 0, 0, 0),
                                          child: Container(
                                            width: 200,
                                            child: TextFormField(
                                              controller: _searchController,
                                              onChanged: (value) {
                                                setState(() {});
                                              },
                                              obscureText: false,
                                              decoration: const InputDecoration(
                                                labelText: 'Cari penginapan...',
                                                labelStyle: TextStyle(
                                                    fontFamily: 'Outfit'),
                                                hintStyle: TextStyle(
                                                    fontFamily: 'Outfit'),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                                filled: true,
                                                fillColor: SIPColor
                                                    .secondaryBackground,
                                              ),
                                              style: const TextStyle(
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                              cursorColor:
                                                  SIPColor.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            StreamBuilder(
                              stream: readPenginapan(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return const Center(
                                    child: Text('Something went wrong!'),
                                  );
                                } else if (snapshot.hasData &&
                                    snapshot.data!.isNotEmpty) {
                                  final dataWisata = snapshot.data!;
                                  filteredPenginapanList = filterPenginapanList(
                                      dataWisata, _searchController.text);

                                  return ListView(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: filteredPenginapanList
                                        .map(buildPenginapan)
                                        .toList(),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      child: Text('Tidak ada data'),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 16, 0, 0),
                            child: StreamBuilder(
                              stream: readKuliner(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return const Center(
                                    child: Text('Something went wrong!'),
                                  );
                                } else if (snapshot.hasData &&
                                    snapshot.data!.isNotEmpty) {
                                  final dataKuliner = snapshot.data!;

                                  return ListView(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children:
                                        dataKuliner.map(buildKuliner).toList(),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      child: Text('Tidak ada data'),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
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

Widget buildPenginapan(Penginapan penginapan) => CardPenginapanMain(
      penginapan: penginapan,
    );

Widget buildKuliner(Kuliner kuliner) => CardKulinerMain(
      kuliner: kuliner,
    );

List<Penginapan> filterPenginapanList(List<Penginapan> data, String query) {
  if (query.isEmpty) {
    return data;
  }

  final lowercaseQuery = query.toLowerCase();

  return data.where((penginapan) {
    final namaPenginapan = penginapan.namaPenginapan.toLowerCase();
    final deskripsi = penginapan.deskripsi.toLowerCase();
    return namaPenginapan.contains(lowercaseQuery) ||
        deskripsi.contains(lowercaseQuery);
  }).toList();
}
