import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart'; // Import paket intl

class AddPlant extends StatefulWidget {
  @override
  State<AddPlant> createState() => _AddPlantState();
}

class _AddPlantState extends State<AddPlant> {
  final TextEditingController _plantController = TextEditingController();
  final TextEditingController _mainController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  // Format tanggal yang diinginkan
  String getFormattedDate() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    // Format tanggal saat ini
    String date = getFormattedDate();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(IconlyLight.discovery),
          onPressed: () async {
            FirebaseFirestore.instance.collection("plants").add({
              "name": _plantController.text,
              "img": "assets/services/${_mainController.text}.jpg",
              "creation_date": date,
              "note": _noteController.text
            }).then((value) {
              Navigator.pop(context);
            }).catchError((error) => print("failed to add data"));
          }),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text(date),
          TextField(
            controller: _plantController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Nama Tanaman",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _mainController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Jenis",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: _noteController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Catatan",
            ),
          ),
          
        ],
      )),
    );
  }
}
