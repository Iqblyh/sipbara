import 'package:flutter/material.dart';
import 'package:sipbara/controller/event_controller.dart';
import 'package:sipbara/model/event/event.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/card_widget.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  TextEditingController _searchController = TextEditingController();
  List<Event> filteredEventList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SIPColor.primaryBackground,
      appBar: AppBar(
        backgroundColor: SIPColor.primaryBackground,
        automaticallyImplyLeading: false,
        title: const Text(
          'Event',
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
        child: SingleChildScrollView(
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
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
                                child: SizedBox(
                                  width: 200,
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    controller: _searchController,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      labelText: 'Cari event...',
                                      labelStyle:
                                          TextStyle(fontFamily: 'Outfit'),
                                      hintStyle:
                                          TextStyle(fontFamily: 'Outfit'),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: SIPColor.primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 0, 12),
                            child: Text(
                              'Event Pariwisata Banjarnegara',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 16,
                                color: SIPColor.secondaryText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 44),
                            child: StreamBuilder(
                              stream: readEventActive(),
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
                                  print(dataWisata);
                                  filteredEventList = filterEventList(
                                      dataWisata, _searchController.text);

                                  return ListView(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: filteredEventList
                                        .map(buildEvent)
                                        .toList(),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                        child: Text('Tidak Ada Event Aktif')),
                                  );
                                }
                              },
                            ),
                            // ListView(
                            //     padding: EdgeInsets.zero,
                            //     primary: false,
                            //     shrinkWrap: true,
                            //     scrollDirection: Axis.vertical,
                            //     children: []
                            // ),
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
    );
  }
}

Widget buildEvent(Event event) => CardEventMain(
      event: event,
    );

List<Event> filterEventList(List<Event> data, String query) {
  if (query.isEmpty) {
    return data;
  }

  final lowercaseQuery = query.toLowerCase();

  return data.where((event) {
    final namaEvent = event.nama_event.toLowerCase();
    final deskripsi = event.deskripsi_event.toLowerCase();
    return namaEvent.contains(lowercaseQuery) ||
        deskripsi.contains(lowercaseQuery);
  }).toList();
}
