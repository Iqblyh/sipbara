import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/event_controller.dart';
import 'package:sipbara/model/event/event.dart';
import 'package:sipbara/page/dashboard/event/dash_event_detail_content.dart';
import 'package:sipbara/page/dashboard/event/edit_event.dart';
import 'package:sipbara/page/menu/event_page/event_page_detail_content.dart';

import '../../../style/color.dart';

class DetailEvent extends StatefulWidget {
  final Event event;

  DetailEvent({super.key, required this.event});

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
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
                actions: [],
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

Widget builDetailEvent(Event event) => EventDetailWidget(
      event: event,
    );
