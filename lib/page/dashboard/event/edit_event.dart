import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/event_controller.dart';
import 'package:sipbara/controller/storage_service.dart';
import 'package:sipbara/model/event/event.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/button_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class EditEventWidget extends StatefulWidget {
  final Event event;
  const EditEventWidget({Key? key, required this.event}) : super(key: key);

  @override
  _EditEventWidgetState createState() => _EditEventWidgetState();
}

class _EditEventWidgetState extends State<EditEventWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  PlatformFile? pickedFile;

  late String tanggal_start = widget.event.time_start.toString();
  late String tanggal_end = widget.event.time_end.toString();

  bool isLoading = false;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  var controllerNamaEvent = TextEditingController();
  var controllerDeskripsi = TextEditingController();
  var controllerContact = TextEditingController();

  @override
  void initState() {
    super.initState();

    controllerNamaEvent.text = widget.event.nama_event;
    controllerDeskripsi.text = widget.event.deskripsi_event;
    controllerContact.text = widget.event.contact;
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
        backgroundColor: SIPColor.secondaryBackground,
        appBar: AppBar(
          backgroundColor: SIPColor.secondaryBackground,
          iconTheme: const IconThemeData(color: SIPColor.primaryText),
          title: const Text(
            'Edit Data Event',
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
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Edit Data Event',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: SIPColor.primaryText,
                      fontSize: 24,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      'Isi form dibawah untuk mengedit event',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Readex Pro',
                        color: SIPColor.secondaryText,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Column(mainAxisSize: MainAxisSize.max, children: [
                    TextFormField(
                      controller: controllerNamaEvent,
                      obscureText: false,
                      decoration: InputDecoration(
                        label: const Text('Nama Event'),
                        labelStyle: const TextStyle(
                          fontFamily: 'Outfit',
                          color: SIPColor.secondaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.normal,
                          color: SIPColor.secondaryText,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        color: SIPColor.primaryText,
                      ),
                      cursorColor: SIPColor.primaryColor,
                    ),
                    TextFormField(
                      controller: controllerDeskripsi,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          fontFamily: 'Outfit',
                          color: SIPColor.secondaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: 'Deskripsi Event...',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.normal,
                          color: SIPColor.secondaryText,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(8, 24, 8, 12),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        color: SIPColor.primaryText,
                      ),
                      cursorColor: SIPColor.primaryColor,
                      maxLines: 100,
                      minLines: 6,
                    ),
                    TextFormField(
                      controller: controllerContact,
                      obscureText: false,
                      decoration: InputDecoration(
                        label: Text('Nomor Kontak'),
                        labelStyle: const TextStyle(
                          fontFamily: 'Outfit',
                          color: SIPColor.secondaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Readex Pro',
                          fontWeight: FontWeight.normal,
                          color: SIPColor.secondaryText,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: SIPColor.error,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        color: SIPColor.primaryText,
                      ),
                      cursorColor: SIPColor.primaryColor,
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: GestureDetector(
                      onTap: selectFile,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Column(
                          children: [
                            if (pickedFile == null)
                              Image.network(
                                widget.event.thumbnail_image,
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            if (pickedFile != null)
                              Image.file(
                                File(pickedFile!.path!),
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: selectFile,
                    child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Container(
                          width: double.infinity,
                          constraints: const BoxConstraints(
                            maxWidth: 500,
                          ),
                          decoration: BoxDecoration(
                            color: SIPColor.secondaryBackground,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: SIPColor.alternate,
                              width: 2,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.add_a_photo_rounded,
                                  color: SIPColor.primaryColor,
                                  size: 32,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Text(
                                    'Ubah Gambar',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: SIPColor.primaryText,
                                      fontFamily: 'Readex Pro',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Tanggal : $tanggal_start - $tanggal_end',
                      style: TextStyle(
                        color: SIPColor.primaryColor,
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: SfDateRangePicker(
                        onSelectionChanged: _onSelectionChanged,
                        selectionMode: DateRangePickerSelectionMode.range,
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                      child: isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : SIPEleButton_Large_Icon(
                              icon: Icons.add_rounded,
                              textButton: 'Edit Wisata',
                              colorBg: SIPColor.primaryColor,
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                final imageName =
                                    '${controllerNamaEvent.text.toLowerCase().replaceAll(' ', '_')}_thumbnail';

                                final subPath = controllerNamaEvent.text
                                    .toLowerCase()
                                    .replaceAll(' ', '_');

                                if (pickedFile != null) {
                                  await Storage().uploadFile(
                                      pickedFile!.path!, subPath, imageName);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  String imageUrl = '';
                                  await Storage()
                                      .downloadURL(subPath, imageName)
                                      .then((String value) {
                                    setState(() {
                                      imageUrl = value;
                                    });
                                  });
                                  final event = Event(
                                      id: widget.event.id,
                                      nama_event: controllerNamaEvent.text,
                                      deskripsi_event: controllerDeskripsi.text,
                                      contact: controllerContact.text,
                                      thumbnail_image: imageUrl,
                                      time_start: DateTime.parse(tanggal_start),
                                      time_end: DateTime.parse(tanggal_end));

                                  await updateEvent(event).whenComplete(() {
                                    int count = 0;
                                    Navigator.of(context)
                                        .popUntil((_) => count++ >= 2);
                                  });

                                  print(imageUrl);

                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: 'Data berhasil diedit!',
                                  );
                                } else {
                                  print('HAhahah');
                                  print(widget.event.thumbnail_image);
                                  final event = Event(
                                      id: widget.event.id,
                                      nama_event: controllerNamaEvent.text,
                                      deskripsi_event: controllerDeskripsi.text,
                                      contact: controllerContact.text,
                                      thumbnail_image:
                                          widget.event.thumbnail_image,
                                      time_start: DateTime.parse(tanggal_start),
                                      time_end: DateTime.parse(tanggal_end));

                                  await updateEvent(event);

                                  await QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: 'Data berhasil diedit!',
                                  );

                                  int count = 0;
                                  Navigator.of(context)
                                      .popUntil((_) => count++ >= 2);
                                }
                              },
                            )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    print(args.value);
    DateTime tanggalStart = args.value.startDate;
    DateTime tanggalEnd = args.value.endDate!;
    setState(() {
      tanggal_start = DateFormat('yyyy-MM-dd').format(tanggalStart);
      tanggal_end = DateFormat('yyyy-MM-dd').format(tanggalEnd);
    });
  }

  Future<LatLng> curretnLatLng() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();
    LatLng latLng = LatLng(position.latitude, position.longitude);

    return latLng;
  }
}
