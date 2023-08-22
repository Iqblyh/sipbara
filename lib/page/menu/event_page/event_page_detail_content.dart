import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/event_controller.dart';
import 'package:sipbara/controller/storage_service.dart';
import 'package:sipbara/model/event/event.dart';
import 'package:sipbara/page/dashboard/event/add_image_modal_event.dart';
import 'package:sipbara/page/dashboard/wisata/add_image_modal.dart';
import 'package:sipbara/style/color.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class EventDetailWidget extends StatefulWidget {
  final Event event;
  const EventDetailWidget({Key? key, required this.event}) : super(key: key);

  @override
  _EventDetailWidgetState createState() => _EventDetailWidgetState();
}

class _EventDetailWidgetState extends State<EventDetailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Builder(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.event.thumbnail_image,
                  width: MediaQuery.sizeOf(context).width,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.event.nama_event,
                    style: const TextStyle(
                      fontSize: 32,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: SIPColor.primaryText,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                    child: Text(
                      '${DateFormat("EEEE || dd MMMM yyy").format(widget.event.time_start)}',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 18,
                        color: SIPColor.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    widget.event.deskripsi_event,
                    style: const TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: SIPColor.secondaryText,
                    ),
                  ),
                  const Divider(
                    height: 32,
                    thickness: 1,
                    color: SIPColor.alternate,
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Media',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Readex Pro',
                              color: SIPColor.secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: const BoxDecoration(),
                      child: StreamBuilder(
                          stream: readMedias(widget.event.id),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text('Something went wrong :('),
                              );
                            } else if (snapshot.hasData) {
                              List images = snapshot.data?['images'];
                              print(images.isEmpty);
                              return ListView.builder(
                                itemCount: images.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  var image = images[index];
                                  if (images.isEmpty) {
                                    return Container(
                                      width: 80,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: SIPColor.secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/add_image.png',
                                          ).image,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Container(
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: SIPColor
                                                    .secondaryBackground,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    '${image['imageUrl']}',
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            } else {
                              return Container(
                                width: 80,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: SIPColor.secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/add_image.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              );
                            }
                          }),
                    ),
                    const Divider(
                      height: 32,
                      thickness: 1,
                      color: SIPColor.alternate,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Kontak',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Readex Pro',
                                  color: SIPColor.primaryText,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.contact_phone_rounded,
                                      color: SIPColor.success,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        '${widget.event.contact}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Readex Pro',
                                          color: SIPColor.secondaryText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        height: 32,
                        thickness: 1,
                        color: SIPColor.alternate,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
