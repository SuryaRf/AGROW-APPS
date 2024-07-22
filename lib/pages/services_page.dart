import 'dart:ui';

import 'package:agriplant/data/TrackingCard.dart';
import 'package:agriplant/data/services.dart';
import 'package:agriplant/pages/add_plant.dart';
import 'package:agriplant/pages/detail_plant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  AddPlant()));
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
                  return Container(
                    padding: EdgeInsets.only(top: 30),
                    height: 1000,
                    child: GridView(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                      ),
                      children: snapshot.data!.docs.map((note) => trackingCard((){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetailPlant(note)));
                      }, note)).toList(),
                    ),
                  );
                }
                return Text("there is no Data");
              },
            ),
          ),
          // Container(
          //   padding: EdgeInsets.only(top: 30),
          //   height: 1000,
          //   child: GridView.builder(
          //     itemCount: services.length,
          //     padding: const EdgeInsets.all(16),
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 1,
          //       childAspectRatio: 2,
          //       crossAxisSpacing: 14,
          //       mainAxisSpacing: 14,
          //     ),
          //     itemBuilder: (context, index) {
          //       return Container(
          //         alignment: Alignment.bottomCenter,
          //         padding: const EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           image: DecorationImage(
          //             image: AssetImage(services[index].image),
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(5),
          //           child: BackdropFilter(
          //             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          //             child: Container(
          //               padding: const EdgeInsets.symmetric(
          //                   vertical: 5, horizontal: 10),
          //               decoration: BoxDecoration(
          //                 color: Colors.white.withOpacity(0.2),
          //                 borderRadius:
          //                     const BorderRadius.all(Radius.circular(5)),
          //               ),
          //               child: Text(
          //                 services[index].name,
          //                 style: const TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 16,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
