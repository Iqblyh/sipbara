import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:sipbara/controller/storage_service.dart';
import 'package:sipbara/controller/wisata/wisata_controller.dart';
import 'package:sipbara/helper/api_key.dart';
import 'package:sipbara/model/review/review.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/button_widget.dart';

import '../../../model/wisata/wisata.dart';

class AddWisataWidget extends StatefulWidget {
  const AddWisataWidget({Key? key}) : super(key: key);

  @override
  _AddWisataWidgetState createState() => _AddWisataWidgetState();
}

class _AddWisataWidgetState extends State<AddWisataWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  String address = "null";
  String autocompletePlace = "null";
  late LatLng pickedLocation = const LatLng(0, 0);
  late LatLng _initialPosition = const LatLng(28.8993468, 76.6250249);

  PlatformFile? pickedFile;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  final controllerNamaWisata = TextEditingController();
  final controllerDeskripsi = TextEditingController();

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
        backgroundColor: SIPColor.secondaryBackground,
        appBar: AppBar(
          backgroundColor: SIPColor.secondaryBackground,
          iconTheme: IconThemeData(color: SIPColor.primaryText),
          title: const Text(
            'Tambah Wisata',
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
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tambah Wisata',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      color: SIPColor.primaryText,
                      fontSize: 24,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      'Isi form dibawah untuk menambahkan wisata',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Readex Pro',
                        color: SIPColor.secondaryText,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Column(mainAxisSize: MainAxisSize.max, children: [
                    TextFormField(
                      controller: controllerNamaWisata,
                      obscureText: false,
                      decoration: InputDecoration(
                        label: Text('Nama Wisata'),
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
                        hintText: 'Deskripsi Wisata...',
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
                            EdgeInsetsDirectional.fromSTEB(8, 24, 8, 12),
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: GestureDetector(
                      onTap: selectFile,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Column(
                          children: [
                            if (pickedFile == null)
                              Image.network(
                                'https://fakeimg.pl/600x400?text=Tambah+Gambar',
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
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
                                    'Tambah Gambar',
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Lokasi :',
                                style: TextStyle(
                                  color: SIPColor.primaryColor,
                                  fontFamily: 'Readex Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Text(
                                  '${pickedLocation.latitude}, ${pickedLocation.longitude}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: SIPColor.secondaryText,
                                    fontFamily: 'Readex Pro',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await curretnLatLng().then((value) {
                              setState(() {
                                _initialPosition = value;
                              });
                              print(_initialPosition);
                            }).then((value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MapLocationPicker(
                                        hideMoreOptions: true,
                                        hideLocationButton: false,
                                        apiKey: google_maps_api_key,
                                        popOnNextButtonTaped: true,
                                        currentLatLng: _initialPosition,
                                        onNext: (GeocodingResult? result) {
                                          if (result != null) {
                                            setState(() {
                                              address =
                                                  result.formattedAddress ?? "";
                                              pickedLocation = LatLng(
                                                  result.geometry.location.lat,
                                                  result.geometry.location.lng);
                                            });
                                          }
                                        },
                                        onSuggestionSelected:
                                            (PlacesDetailsResponse? result) {
                                          if (result != null) {
                                            setState(() {
                                              autocompletePlace = result.result
                                                      .formattedAddress ??
                                                  "";
                                            });
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ));
                          },
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.add_location_rounded,
                                    color: SIPColor.primaryColor,
                                    size: 32,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 0, 0, 0),
                                    child: Text(
                                      'Pilih Lokasi',
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
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                      child: isLoading
                          ? Center(child: CircularProgressIndicator())
                          : SIPEleButton_Large_Icon(
                              icon: Icons.add_rounded,
                              textButton: 'Tambah Wisata',
                              colorBg: SIPColor.primaryColor,
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                final imageName =
                                    '${controllerNamaWisata.text.toLowerCase().replaceAll(' ', '_')}_thumbnail';

                                final subPath = controllerNamaWisata.text
                                    .toLowerCase()
                                    .replaceAll(' ', '_');

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
                                final wisata = Wisata(
                                  nama_wisata: controllerNamaWisata.text,
                                  deskripsi_wisata: controllerDeskripsi.text,
                                  thumbnail_image: imageUrl,
                                  lat: pickedLocation.latitude.toString(),
                                  long: pickedLocation.longitude.toString(),
                                  images: [],
                                );

                                final reviews = Reviews(
                                  reviews: [],
                                );

                                await tambahWisata(wisata, reviews);

                                print(imageUrl);

                                Navigator.of(context).pop();
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
