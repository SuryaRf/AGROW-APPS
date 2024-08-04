import 'package:agriplant/pages/services_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

Widget trackingCard(Function()? onTap, QueryDocumentSnapshot doc) {
  // Convert Timestamp to DateTime
  Timestamp timestamp = doc["creation_date"] as Timestamp;
  DateTime creationDate = timestamp.toDate();

  // Format DateTime
  String formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(creationDate);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(color: Colors.green.shade50),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: onTap,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, top: 10),
                    height: 170,
                    width: 150,
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(doc["img"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: IconButton(
                                icon: Icon(Icons.delete_forever_outlined,
                                    color: Colors.red),
                                onPressed: () {
                                  ServicesPage().deletePlant(doc.id);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jenis Tanaman: ${doc["name"]}",
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Tanggal Pembuatan:\n$formattedDate",
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 60, top: 25),
                          child: ElevatedButton(
                            onPressed: onTap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .green.shade50, // Warna latar belakang tombol

                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0), // Padding dalam tombol
                              textStyle: GoogleFonts.poppins().copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Bentuk border
                              ),
                              side: BorderSide(color: Colors.green.shade100),
                            ),
                            child: const Row(
                              children: [
                                Text("Lihat Detail"),
                                Icon(Icons.arrow_right_rounded)
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
