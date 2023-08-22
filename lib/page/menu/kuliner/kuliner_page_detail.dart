import 'package:flutter/material.dart';
import 'package:sipbara/controller/kuliner_controller.dart';
import 'package:sipbara/model/kuliner/kuliner.dart';
import 'package:sipbara/page/menu/kuliner/kuliner_page_detail_contain.dart';

import '../../../style/color.dart';

class DetailKuliner extends StatefulWidget {
  final Kuliner kuliner;

  DetailKuliner({super.key, required this.kuliner});

  @override
  State<DetailKuliner> createState() => _DetailKulinerState();
}

class _DetailKulinerState extends State<DetailKuliner> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readDetailKuliner(widget.kuliner.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        } else if (snapshot.hasData) {
          final kuliner = snapshot.data!;
          return Scaffold(
              backgroundColor: SIPColor.primaryBackground,
              appBar: AppBar(
                backgroundColor: SIPColor.primaryBackground,
                iconTheme: const IconThemeData(color: SIPColor.primaryText),
                title: const Text(
                  'Detail Kuliner',
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
              body: builDetailKuliner(
                Kuliner(
                  id: kuliner['idKuliner'],
                  namaKuliner: kuliner['nama'],
                  deskripsi: kuliner['deskripsi'],
                  thumbnail_image: kuliner['thumbnail'],
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

Widget builDetailKuliner(Kuliner kuliner) => KulinerDetailWidget(
      kuliner: kuliner,
    );
