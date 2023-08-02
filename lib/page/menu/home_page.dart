import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sipbara/controller/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/button_widget.dart';
import 'package:sipbara/widget/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String? satuan = '';
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            height: 500,
            child: Stack(
              alignment: AlignmentDirectional(0, -1),
              children: [
                Align(
                  alignment: AlignmentDirectional(0.05, -1),
                  child: Image.asset(
                    'assets/images/watu_desel.jpg',
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Color(0x8D090F13),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 24, 16, 44),
                          child: Text(
                            'Jelajahi beragam\ndestinasi wisata di \nBanjarnegara',
                            style: TextStyle(
                              color: SIPColor.primaryBackground,
                              fontSize: 36,
                              fontFamily: 'Lexend Deca',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                          child: Container(
                            width: double.infinity,
                            height: 700,
                            decoration: const BoxDecoration(
                              color: SIPColor.primaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 8, 0, 24),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Divider(
                                      height: 8,
                                      thickness: 4,
                                      indent: 140,
                                      endIndent: 140,
                                      color: SIPColor.alternate,
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 0),
                                      child: Text(
                                        'Kunjungi destinasi terpopuler',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400,
                                          color: SIPColor.secondaryText,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 16, 0),
                                      child: Text(
                                        '5 destinasi pilihan',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 14,
                                          color: SIPColor.secondaryText,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 210,
                                        decoration: const BoxDecoration(
                                          color: SIPColor.primaryBackground,
                                        ),
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            CardWidget_Small(
                                              imageUrl:
                                                  'https://images.unsplash.com/photo-1534445867742-43195f401b6c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8aXRhbHl8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                              cardLabel: 'Cinque Terre',
                                              rating: 4.7,
                                            ),
                                            CardWidget_Small(
                                              imageUrl:
                                                  'https://images.unsplash.com/photo-1534445867742-43195f401b6c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8aXRhbHl8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                              cardLabel: 'Cinque Terre',
                                              rating: 4.7,
                                            ),
                                            CardWidget_Small(
                                              imageUrl:
                                                  'https://images.unsplash.com/photo-1534445867742-43195f401b6c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8aXRhbHl8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                              cardLabel: 'Cinque Terre',
                                              rating: 4.7,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 0),
                                      child: Text(
                                        'Wisata Alam',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400,
                                          color: SIPColor.secondaryText,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 16, 0),
                                      child: Text(
                                        '5 spot yang cocok bagi kamu para pecinta alam',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 14,
                                          color: SIPColor.secondaryText,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      child: ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          CardWidget_Large(),
                                          CardWidget_Large(),
                                          CardWidget_Large(),
                                          CardWidget_Large(),
                                          CardWidget_Large(),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 16, 0),
                                      child: Text(
                                        'Galeri',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400,
                                          color: SIPColor.secondaryText,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 16, 0),
                                      child: Text(
                                        'Kumpulan foto terbaru',
                                        style: TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 14,
                                          color: SIPColor.secondaryText,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 16, 200),
                                      child: SIPEleButton(
                                        onPressed: () {},
                                        textButton: 'Cek Selengkapnya',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 44,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    // Container(
    //   width: MediaQuery.sizeOf(context).width,
    //   height: MediaQuery.sizeOf(context).height * 1,
    //   decoration: BoxDecoration(
    //     color: Color(0xFF14181B),
    //     image: DecorationImage(
    //       fit: BoxFit.cover,
    //       image: Image.asset('assets/images/candi1.png').image,
    //     ),
    //   ),
    //   child: Container(
    //     width: 100,
    //     height: 100,
    //     decoration: BoxDecoration(
    //       color: Color(0x990F1113),
    //     ),
    //   ),
    // ),
  }
}
