// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sipbara/controller/storage_service.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//
// class Homp extends StatefulWidget {
//   const Homp({super.key});
//
//   @override
//   State<Homp> createState() => _HompState();
// }
//
// class _HompState extends State<Homp> {
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;
//     final Storage storage = Storage();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: () async {
//                 final results = await FilePicker.platform.pickFiles(
//                   allowMultiple: false,
//                   type: FileType.custom,
//                   allowedExtensions: ['png', 'jpg'],
//                 );
//
//                 if (results == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('No file selected.'),
//                     ),
//                   );
//                   return null;
//                 }
//
//                 final path = results.files.single.path!;
//                 final fileName = results.files.single.name;
//
//                 storage.uploadFile(path, 'asd', fileName).then(
//                       (value) => debugPrint('Done'),
//                     );
//               },
//               child: const Text('Upload File'),
//             ),
//           ),
//           FutureBuilder(
//               future: storage.listFiles(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<firebase_storage.ListResult> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done &&
//                     snapshot.hasData) {
//                   return Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     height: 50,
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         shrinkWrap: true,
//                         itemCount: snapshot.data!.items.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               child: Text(snapshot.data!.items[index].name),
//                             ),
//                           );
//                         }),
//                   );
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting ||
//                     !snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 }
//                 return Container();
//               }),
//           FutureBuilder(
//               future: storage.downloadURL('candi.jpg'),
//               builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done &&
//                     snapshot.hasData) {
//                   print(snapshot.data!);
//                   return Container(
//                     width: 300,
//                     height: 250,
//                     child: Image.network(
//                       snapshot.data!,
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 }
//                 if (snapshot.connectionState == ConnectionState.waiting ||
//                     !snapshot.hasData) {
//                   return CircularProgressIndicator();
//                 }
//                 return Container();
//               }),
//           const SizedBox(
//             height: 24,
//           ),
//           Text('Sign In as ${user.email!}'),
//           TextButton(
//               onPressed: () {
//                 FirebaseAuth.instance.signOut();
//               },
//               child: const Text('Sign Out')),
//         ],
//       ),
//     );
//   }
// }
