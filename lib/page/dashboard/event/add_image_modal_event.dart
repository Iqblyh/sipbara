import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/storage_service.dart';
import '../../../style/color.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/card_widget.dart';

class AddImageModalEvent extends StatefulWidget {
  final String subPath;
  final String idEvent;
  AddImageModalEvent({super.key, required this.subPath, required this.idEvent});

  @override
  State<AddImageModalEvent> createState() => _AddImageModalEventState();
}

class _AddImageModalEventState extends State<AddImageModalEvent> {
  List<File> _image = [];
  final filePicker = ImagePicker();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: SIPColor.secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: 8,
              thickness: 4,
              indent: 140,
              endIndent: 140,
              color: SIPColor.alternate,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Tambah Media',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            color: SIPColor.primaryText,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    child: GridView.builder(
                      itemCount: _image.length + 1,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return index == _image.length
                            ? GestureDetector(
                                onTap: () {
                                  chooseImage();
                                },
                                child: AddImageCard(
                                  image: 'assets/images/add_image.png',
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                                child: Stack(
                                  children: [
                                    ImageCard_Small(image: _image[index]),
                                    Align(
                                      alignment: AlignmentDirectional(1, -1),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _image.removeAt(index);
                                          });
                                        },
                                        child: Icon(
                                          Icons.cancel,
                                          color: SIPColor.error,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, childAspectRatio: .9),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: isLoading == false
                          ? SIPEleButton_Large_Icon(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await Storage()
                                    .uploadMediaEvent(
                                        _image, widget.subPath, widget.idEvent)
                                    .whenComplete(
                                        () => Navigator.of(context).pop());

                                setState(() {
                                  isLoading = false;
                                  _image.clear();
                                });
                              },
                              icon: Icons.add_rounded,
                              textButton: 'Tambah Media',
                              colorBg: SIPColor.primaryColor,
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  chooseImage() async {
    final pickedFile = await filePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
    if (pickedFile?.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await filePicker.retrieveLostData();

    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }
}
