import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/event_controller.dart';
import 'package:sipbara/model/event/event.dart';
import 'package:sipbara/page/dashboard/event/dash_event_detail_content.dart';
import 'package:sipbara/page/dashboard/event/edit_event.dart';

import '../../../style/color.dart';

class DashDetailEvent extends StatefulWidget {
  final Event event;

  DashDetailEvent({super.key, required this.event});

  @override
  State<DashDetailEvent> createState() => _DashDetailEventState();
}

class _DashDetailEventState extends State<DashDetailEvent> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readDetailEvent(widget.event.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        } else if (snapshot.hasData) {
          final event = snapshot.data!;
          return Scaffold(
              backgroundColor: SIPColor.primaryBackground,
              appBar: AppBar(
                backgroundColor: SIPColor.primaryBackground,
                iconTheme: const IconThemeData(color: SIPColor.primaryText),
                title: const Text(
                  'Detail Event',
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
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                EditEventWidget(event: widget.event)));
                      },
                      child: Icon(
                        Icons.edit_rounded,
                        color: SIPColor.secondaryColor,
                        size: 24,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: 'Hapus Data?',
                          text: 'Apakah anda ingin menghapus data?',
                          onConfirmBtnTap: () async {
                            final String subPath = widget.event.nama_event
                                .toLowerCase()
                                .replaceAll(' ', '_');
                            await deleteEvent(
                              widget.event.id,
                              subPath,
                            );
                            int count = 0;
                            Navigator.of(context).popUntil((_) => count++ >= 2);

                            await QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: 'Data berhasil dihapus',
                            );
                          });
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      child: Icon(
                        Icons.delete_rounded,
                        color: SIPColor.error,
                        size: 24,
                      ),
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0,
              ),
              body: builDetailEvent(
                Event(
                  nama_event: event['nama_event'],
                  deskripsi_event: event['deskripsi_event'],
                  id: event['idEvent'],
                  thumbnail_image: event['thumbnail'],
                  time_start: (event['tanggal_start'] as Timestamp).toDate(),
                  time_end: (event['tanggal_end'] as Timestamp).toDate(),
                  contact: event['contact'],
                ),
              ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

Widget builDetailEvent(Event event) => EventDetailAdminWidget(
      event: event,
    );
