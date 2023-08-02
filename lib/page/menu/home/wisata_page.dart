import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sipbara/page/menu/home/wisata_page_detail.dart';
import 'package:sipbara/page/review/add_review.dart';
import 'package:sipbara/style/color.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class WisataPage extends StatefulWidget {
  const WisataPage({super.key});

  @override
  State<WisataPage> createState() => _WisataPageState();
}

class _WisataPageState extends State<WisataPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: SIPColor.primaryBackground,
      appBar: AppBar(
        backgroundColor: SIPColor.primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
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
                decoration: BoxDecoration(
                  color: SIPColor.primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: SIPColor.secondaryBackground,
                      boxShadow: [
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
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 8, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: SIPColor.secondaryText,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Container(
                                width: 200,
                                child: TextFormField(
                                  obscureText: false,
                                  decoration: InputDecoration(
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
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  cursorColor: SIPColor.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: SIPColor.alternate,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                child: Icon(
                                  Icons.tune_rounded,
                                  color: SIPColor.secondaryText,
                                ),
                              ),
                            ),
                          )
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
                  Padding(
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 44),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailWisata()));
                            },
                            child: Container(
                              width: 220,
                              height: 240,
                              decoration: BoxDecoration(
                                color: SIPColor.secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: SIPColor.alternate,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              'https://images.unsplash.com/photo-1600357169193-19bd51d2a6ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGJlYWNoaG91c2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        'Nama Wisata',
                                        style: TextStyle(
                                          fontFamily: 'Outfit',
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                          color: SIPColor.primaryText,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 8),
                                          child: Row(
                                            children: [
                                              RatingBarIndicator(
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons
                                                      .radio_button_checked_rounded,
                                                  color: SIPColor.primaryText,
                                                ),
                                                direction: Axis.horizontal,
                                                rating: 4,
                                                unratedColor:
                                                    SIPColor.secondaryText,
                                                itemCount: 5,
                                                itemSize: 16,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
                                                child: Text(
                                                  '4.7',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Lexend Deca',
                                                    color:
                                                        SIPColor.secondaryText,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 8),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Desa, Kecamatan',
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style: TextStyle(
                                                fontFamily: 'Outfit',
                                                fontSize: 16,
                                                color: SIPColor.secondaryText,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SafeArea(
                    child: SizedBox(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
