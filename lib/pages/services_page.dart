import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:agriplant/pages/add_plant.dart';
import 'package:agriplant/pages/detail_plant.dart';
import 'package:agriplant/data/TrackingCard.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking Tanaman', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green.shade50,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.green.shade300, // Warna border bawah
            height: 1.0, // Tinggi border
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          IconlyLight.paperPlus,
          size: 30,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(45.0)),
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPlant()));
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("plants").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }

                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      children: snapshot.data!.docs
                          .map((note) => trackingCard(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPlant(note)));
                              }, note))
                          .toList(),
                    ),
                  );
                }
                return Text("There is no Data");
              },
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menghapus dokumen dari Firestore
  void deletePlant(String id) {
    FirebaseFirestore.instance.collection("plants").doc(id).delete().then((_) {
      print("Document successfully deleted!");
    }).catchError((error) {
      print("Error removing document: $error");
    });
  }
}
