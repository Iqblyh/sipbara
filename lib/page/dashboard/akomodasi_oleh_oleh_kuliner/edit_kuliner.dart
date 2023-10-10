import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sipbara/controller/kuliner_controller.dart';
import 'package:sipbara/controller/storage_service.dart';
import 'package:sipbara/model/kuliner/kuliner.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/button_widget.dart';

class EditKulinerWidget extends StatefulWidget {
  final Kuliner kuliner;
  const EditKulinerWidget({Key? key, required this.kuliner}) : super(key: key);

  @override
  _EditKulinerWidgetState createState() => _EditKulinerWidgetState();
}

class _EditKulinerWidgetState extends State<EditKulinerWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  PlatformFile? pickedFile;

  bool isLoading = false;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  var controllerNamaKuliner = TextEditingController();
  var controllerDeskripsi = TextEditingController();

  @override
  void initState() {
    super.initState();

    controllerNamaKuliner.text = widget.kuliner.namaKuliner;
    controllerDeskripsi.text = widget.kuliner.deskripsi;
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
            'Edit Data Penginapan',
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
                    'Edit Data',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: SIPColor.primaryText,
                      fontSize: 24,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      'Isi form dibawah untuk mengedit data',
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
                      controller: controllerNamaKuliner,
                      obscureText: false,
                      decoration: InputDecoration(
                        label: const Text('Nama Kuliner / Oleh2'),
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
                        hintText: 'Deskripsi Kuliner / Oleh2...',
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
                                widget.kuliner.thumbnail_image,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                      child: isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : SIPEleButton_Large_Icon(
                              icon: Icons.add_rounded,
                              textButton: 'Edit Data',
                              colorBg: SIPColor.primaryColor,
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                final imageName =
                                    '${controllerNamaKuliner.text.toLowerCase().replaceAll(' ', '_')}_thumbnail';

                                final subPath = controllerNamaKuliner.text
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
                                  final kuliner = Kuliner(
                                    id: widget.kuliner.id,
                                    namaKuliner: controllerNamaKuliner.text,
                                    deskripsi: controllerDeskripsi.text,
                                    thumbnail_image: imageUrl,
                                  );

                                  await updateKuliner(kuliner).whenComplete(() {
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
                                  print(widget.kuliner.thumbnail_image);
                                  final kuliner = Kuliner(
                                    id: widget.kuliner.id,
                                    namaKuliner: controllerNamaKuliner.text,
                                    deskripsi: controllerDeskripsi.text,
                                    thumbnail_image:
                                        widget.kuliner.thumbnail_image,
                                  );

                                  await updateKuliner(kuliner);

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

  Future<LatLng> curretnLatLng() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition();
    LatLng latLng = LatLng(position.latitude, position.longitude);

    return latLng;
  }
}
