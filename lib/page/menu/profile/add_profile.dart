import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart' as fire_auth;
import 'package:flutter/material.dart';
import 'package:sipbara/controller/storage_service.dart';
import 'package:sipbara/controller/user_profile.dart';
import 'package:sipbara/model/user/user.dart';
import 'package:sipbara/style/color.dart';
import 'package:sipbara/widget/button_widget.dart';

class ProfilecreateWidget extends StatefulWidget {
  const ProfilecreateWidget({Key? key}) : super(key: key);

  @override
  _ProfilecreateWidgetState createState() => _ProfilecreateWidgetState();
}

class _ProfilecreateWidgetState extends State<ProfilecreateWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  PlatformFile? pickedFile;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  final nameController = TextEditingController();
  final myBioController = TextEditingController();

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: SIPColor.primaryBackground,
      appBar: AppBar(
        backgroundColor: SIPColor.primaryBackground,
        iconTheme: IconThemeData(color: SIPColor.primaryText),
        title: const Text(
          'Tambah Profil',
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
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      selectFile();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xFFDBE2E7),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Column(
                            children: [
                              if (pickedFile == null)
                                Image.asset(
                                  'assets/images/profile-icon.png',
                                  height: 96,
                                  width: 6,
                                  fit: BoxFit.cover,
                                  scale: 2,
                                ),
                              if (pickedFile != null)
                                Image.file(
                                  File(pickedFile!.path!),
                                  fit: BoxFit.cover,
                                  scale: 2,
                                  height: 96,
                                  width: 96,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
              child: TextFormField(
                controller: nameController,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Readex Pro',
                    color: SIPColor.primaryText,
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Readex Pro',
                    color: SIPColor.primaryText,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: SIPColor.primaryBackground,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: SIPColor.secondaryBackground,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Readex Pro',
                  color: SIPColor.primaryText,
                ),
                maxLines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 12),
              child: TextFormField(
                controller: myBioController,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Readex Pro',
                    color: SIPColor.primaryText,
                  ),
                  hintText: 'Bio',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Readex Pro',
                    color: SIPColor.primaryText,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: SIPColor.primaryBackground,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: SIPColor.secondaryBackground,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                ),
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Readex Pro',
                  color: SIPColor.primaryText,
                ),
                textAlign: TextAlign.start,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 12),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SIPEleButton_Large_Icon(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        final imageName =
                            '${nameController.text.toLowerCase().replaceAll(' ', '_')}_profilePicture';
                        final currentUid =
                            fire_auth.FirebaseAuth.instance.currentUser!.uid;
                        final subPath = ('profile/$currentUid');

                        await Storage()
                            .uploadFile(pickedFile!.path!, subPath, imageName);
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

                        final user = User(
                            nama: nameController.text,
                            bio: myBioController.text,
                            profilePicture: imageUrl);

                        await updateProfile(user);

                        Navigator.of(context).pop();
                      },
                      icon: Icons.add,
                      colorBg: SIPColor.primaryColor,
                      textButton: 'Tambah Profile',
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
