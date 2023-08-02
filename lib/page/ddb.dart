import 'package:flutter/material.dart';
import 'package:sipbara/page/main_page.dart';

class DDB extends StatefulWidget {
  const DDB({super.key});

  @override
  State<DDB> createState() => _DDBState();
}

class _DDBState extends State<DDB> {
  String satuan = 'USA';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DDB'),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton(
              style: TextStyle(color: Colors.red),
              value: satuan,
              items: dropdownItems,
              isExpanded: true,
              onChanged: (String? newVal) {
                setState(() {
                  satuan = newVal!;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  print(satuan);
                },
                child: Text('Coba'))
          ],
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"), value: "USA"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    DropdownMenuItem(child: Text("England"), value: "England"),
  ];
  return menuItems;
}
