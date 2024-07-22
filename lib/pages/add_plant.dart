import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class AddPlant extends StatefulWidget {
  @override
  State<AddPlant> createState() => _AddPlantState();
}

class _AddPlantState extends State<AddPlant> {
  TextEditingController _plantController = TextEditingController();
  TextEditingController _mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // String img = widget.doc["img"];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(IconlyLight.discovery),
          onPressed: () async {
            FirebaseFirestore.instance.collection("plants").add({
              "name": _plantController.text,
              "img": "assets/services/${_mainController.text}.jpg",
            }).then((value) {
              print(value.id);
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
          Text("halo dek"),
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
          // Image.asset("assets/services/${_plantController.text}.jpg")
        ],
      )),
    );
  }
}
