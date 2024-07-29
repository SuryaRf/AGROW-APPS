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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jenis Tanaman: ${doc["name"]}",
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Tanggal Pembuatan: $formattedDate",
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              ServicesPage().deletePlant(doc.id);
                            },
                          ),
                        ),
                      ],
                    ),
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
