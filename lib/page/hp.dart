import 'package:flutter/material.dart';
import 'package:sipbara/style/color.dart';

class HPage extends StatefulWidget {
  const HPage({super.key});

  @override
  State<HPage> createState() => _HPageState();
}

class _HPageState extends State<HPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    flexibleSpace: Container(
                      width: double.infinity,
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
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 24),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Jelajahi beragam\ndestinasi wisata di \nBanjarnegara',
                                        style: TextStyle(
                                          color: SIPColor.primaryBackground,
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 36,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    floating: true,
                    snap: true,
                    expandedHeight: 200.0,
                    forceElevated: innerBoxIsScrolled,
                  ),
                ),
              ];
            },
            body: Container(
              width: double.infinity,
              height: 500,
              child: Builder(builder: (BuildContext context) {
                return CustomScrollView(
                  // The "controller" and "primary" members should be left unset, so that
                  // the NestedScrollView can control this inner scroll view.
                  // If the "controller" property is set, then this scroll view will not
                  // be associated with the NestedScrollView.
                  slivers: <Widget>[
                    SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context)),
                    SliverFixedExtentList(
                      itemExtent: 48.0,
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) =>
                            ListTile(title: Text('Item $index')),
                        childCount: 30,
                      ),
                    ),
                  ],
                );
              }),
            )));
  }
}
