import 'package:flutter/material.dart';
import 'package:sipbara/controller/event_controller.dart';
import 'package:sipbara/model/event/event.dart';
import 'package:sipbara/page/dashboard/event/add_event.dart';
import 'package:sipbara/style/color.dart';

import '../../../widget/card_widget.dart';

class DashEventWidget extends StatefulWidget {
  const DashEventWidget({Key? key}) : super(key: key);

  @override
  _DashEventWidgetState createState() => _DashEventWidgetState();
}

class _DashEventWidgetState extends State<DashEventWidget> {
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
            'Data Event',
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
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddEvent()));
                },
                child: Icon(
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
                        text: 'Aktif',
                      ),
                      Tab(
                        text: 'Tidak aktif',
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
                              stream: readEventActive(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  print(snapshot.error);
                                  return const Center(
                                    child: Text('Something went wrong!'),
                                  );
                                } else if (snapshot.hasData) {
                                  final dataEvent = snapshot.data!;

                                  return ListView(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    children:
                                        dataEvent.map(buildEvent).toList(),
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
                              stream: readEventNotActive(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  print(snapshot.error);
                                  return const Center(
                                    child: Text('Something went wrong!'),
                                  );
                                } else if (snapshot.hasData) {
                                  final dataEvent = snapshot.data!;

                                  return ListView(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    children:
                                        dataEvent.map(buildEvent).toList(),
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

Widget buildEvent(Event event) => CardDashEvent(
      event: event,
    );
