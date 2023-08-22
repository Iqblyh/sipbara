import 'package:flutter/material.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/card_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../controller/wisata/wisata_controller.dart';
import '../../../model/wisata/wisata.dart';

class WisataPage extends StatefulWidget {
  const WisataPage({super.key});

  @override
  State<WisataPage> createState() => _WisataPageState();
}

class _WisataPageState extends State<WisataPage> {
  TextEditingController _searchController = TextEditingController();
  List<Wisata> filteredWisataList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: SIPColor.primaryBackground,
      appBar: AppBar(
        backgroundColor: SIPColor.primaryBackground,
        automaticallyImplyLeading: false,
        title: const Text(
          'Wisata',
          style: TextStyle(
            fontSize: 22,
            color: SIPColor.primaryText,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StickyHeader(
              overlapHeaders: false,
              header: Container(
                width: double.infinity,
                height: 80,
                decoration: const BoxDecoration(
                  color: SIPColor.primaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: SIPColor.secondaryBackground,
                      boxShadow: [
                        const BoxShadow(
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4, 0, 0, 0),
                              child: Container(
                                width: 200,
                                child: TextFormField(
                                  controller: _searchController,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                    labelText: 'Cari wisata....',
                                    labelStyle: TextStyle(fontFamily: 'Outfit'),
                                    hintStyle: TextStyle(fontFamily: 'Outfit'),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    filled: true,
                                    fillColor: SIPColor.secondaryBackground,
                                  ),
                                  style: const TextStyle(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  cursorColor: SIPColor.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          //filter button++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                          // Container(
                          //   decoration: BoxDecoration(
                          //     border: Border.all(
                          //       width: 1,
                          //       color: SIPColor.alternate,
                          //     ),
                          //     borderRadius: BorderRadius.circular(8),
                          //   ),
                          //   child: const Padding(
                          //     padding: EdgeInsets.all(8.0),
                          //     child: InkWell(
                          //       child: Icon(
                          //         Icons.tune_rounded,
                          //         color: SIPColor.secondaryText,
                          //       ),
                          //     ),
                          //   ),
                          // )
                          //filter button++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //       backgroundColor: Colors.transparent,
                          //       elevation: 0,
                          //       shape: RoundedRectangleBorder(
                          //         side: const BorderSide(
                          //           width: 1,
                          //           color: SIPColor.secondaryText,
                          //         ),
                          //         borderRadius: BorderRadius.circular(8),
                          //       )),
                          //   child: Icon(
                          //     Icons.tune_rounded,
                          //     color: SIPColor.primaryText,
                          //     size: 24,
                          //   ),
                          //   onPressed: () {
                          //     print('IconButton pressed ...');
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 12),
                    child: Text(
                      'Wisata Banjarnegara',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 16,
                        color: SIPColor.secondaryText,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 44),
                    child: Container(
                      height: size.height,
                      child: StreamBuilder(
                        stream: readWisata(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError &&
                              snapshot.data!.isNotEmpty) {
                            return const Center(
                              child: Text('Something went wrong!'),
                            );
                          } else if (snapshot.hasData) {
                            final dataWisata = snapshot.data!;
                            filteredWisataList = filterWisataList(
                                dataWisata, _searchController.text);

                            return ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              children:
                                  filteredWisataList.map(buildWisata).toList(),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                child: Text('Tidak ada data wisata'),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildWisata(Wisata wisata) => CardWisataMain(
      wisata: wisata,
    );

List<Wisata> filterWisataList(List<Wisata> data, String query) {
  if (query.isEmpty) {
    return data;
  }

  final lowercaseQuery = query.toLowerCase();

  return data.where((wisata) {
    final namaWisata = wisata.nama_wisata.toLowerCase();
    final deskripsi = wisata.deskripsi_wisata.toLowerCase();
    return namaWisata.contains(lowercaseQuery) ||
        deskripsi.contains(lowercaseQuery);
  }).toList();
}
