import 'package:agriplant/pages/ai_grow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import intl

import 'plant_monitoring.dart';

class DetailPlant extends StatefulWidget {
  DetailPlant(this.doc, {Key? key}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  State<DetailPlant> createState() => _DetailPlantState();
}

class _DetailPlantState extends State<DetailPlant> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    // Convert Timestamp to DateTime
    Timestamp timestamp = widget.doc["creation_date"] as Timestamp;
    DateTime creationDate = timestamp.toDate();

    // Format DateTime
    String formattedDate =
        DateFormat('dd MMM yyyy, HH:mm').format(creationDate);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 180,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(widget.doc["img"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Tentang Tanaman",
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Jenis Tanaman: ${widget.doc["name"]}",
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Tanggal Pembuatan: $formattedDate", // Use formatted date
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Catatan: ${widget.doc["note"]}",
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Fitur Khusus",
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlantMonitoringPage(plantDoc: widget.doc),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 220,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 243, 243, 243),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green.withOpacity(0.5),
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(1, 2))
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/growth.png",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Tracking \nPertumbuhan Tanaman",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AiGrow()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 220,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 243, 243, 243),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green.withOpacity(0.5),
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(1, 2))
                        ]),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/human.png",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Chat \n Dengan AIgrow",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
