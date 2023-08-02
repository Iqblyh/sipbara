import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sipbara/style/color.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SIPColor.secondaryBackground,
      appBar: AppBar(
        backgroundColor: SIPColor.secondaryBackground,
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
        actions: [],
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
                    // useToggleButtonStyle: true,
                    // labelStyle: FlutterFlowTheme.of(context).titleMedium,
                    // unselectedLabelStyle:
                    //     FlutterFlowTheme.of(context).titleMedium,
                    // labelColor: FlutterFlowTheme.of(context).primaryText,
                    // unselectedLabelColor:
                    //     FlutterFlowTheme.of(context).secondaryText,
                    // backgroundColor:
                    //     FlutterFlowTheme.of(context).secondaryBackground,
                    // unselectedBackgroundColor:
                    //     FlutterFlowTheme.of(context).alternate,
                    // borderColor: FlutterFlowTheme.of(context).primary,
                    // unselectedBorderColor:
                    //     FlutterFlowTheme.of(context).alternate,
                    // borderWidth: 0,
                    // borderRadius: 0,
                    // elevation: 0,
                    // buttonMargin: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    tabs: [
                      Tab(
                        text: 'Akomodasi',
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 8, 0),
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
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: Container(
                                            width: 200,
                                            child: TextFormField(
                                              obscureText: false,
                                              decoration: const InputDecoration(
                                                labelText: 'Cari akomodasi...',
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
                            ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
                                    child: Container(
                                      width: double.infinity,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
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
                                            const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Text(
                                                'Nama Akomodasi',
                                                style: TextStyle(
                                                  fontFamily: 'Outfit',
                                                  color: SIPColor.primaryText,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 8),
                                                  child: RichText(
                                                    text: const TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: '\$421',
                                                          style: TextStyle(
                                                              color: SIPColor
                                                                  .primaryColor,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                        TextSpan(
                                                          text: ' /night',
                                                          style: TextStyle(
                                                            color: SIPColor
                                                                .secondaryText,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        )
                                                      ],
                                                      style: TextStyle(
                                                        fontFamily: 'Outfit',
                                                        color: SIPColor
                                                            .primaryText,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 8),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Kauai, Hawaii',
                                                          style: TextStyle(),
                                                        )
                                                      ],
                                                      style: TextStyle(
                                                        fontFamily: 'Outfit',
                                                        color: SIPColor
                                                            .secondaryText,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                ]),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 16, 0),
                                    child: Container(
                                      width: double.infinity,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 8, 8, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://images.unsplash.com/photo-1600357169193-19bd51d2a6ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGJlYWNoaG91c2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Color(0x004B39EF),
                                                            SIPColor.primaryText
                                                          ],
                                                          stops: [0, 1],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0, -1),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1, 1),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 0, 0, 16),
                                                      child: GradientText(
                                                        'Dawet Ayu',
                                                        style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        colors: [
                                                          SIPColor.primaryColor,
                                                          SIPColor
                                                              .secondaryColor
                                                        ],
                                                        gradientDirection:
                                                            GradientDirection
                                                                .ltr,
                                                        gradientType:
                                                            GradientType.linear,
                                                      ),
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
                                ]),
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
