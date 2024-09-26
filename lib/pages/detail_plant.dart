import 'package:agriplant/pages/modal_hasil_panen.dart';
import 'package:agriplant/pages/plant_monitoring.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import intl
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ai_grow.dart';
import 'reminder_dialog.dart'; // Import ReminderDialog

class DetailPlant extends StatefulWidget {
  const DetailPlant(this.doc, {super.key});
  final QueryDocumentSnapshot doc;

  @override
  State<DetailPlant> createState() => _DetailPlantState();
}

class _DetailPlantState extends State<DetailPlant> {
  
  @override
  Widget build(BuildContext context) {
        final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final w = MediaQuery.of(context).size.width;

    // Convert Timestamp to DateTime
    Timestamp timestamp = widget.doc["creation_date"] as Timestamp;
    DateTime creationDate = timestamp.toDate();

    // Format DateTime
    String formattedDate =
        DateFormat('dd MMM yyyy, HH:mm').format(creationDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tanaman'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                height: height * 0.27,
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
               SizedBox(height: height * 0.015),
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
               SizedBox(height: height * 0.01),
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
               SizedBox(height: height * 0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Tanggal Pembuatan: $formattedDate",
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
               SizedBox(height: height * 0.01),
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
               SizedBox(height: height * 0.02),
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
               SizedBox(height: height * 0.02),
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
                      height: height * 0.265,
                      width: w * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 243, 243, 243),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.green.withOpacity(0.5),
                                blurRadius: 3,
                                spreadRadius: 1,
                                offset: const Offset(1, 2))
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
                              builder: (context) => const ModalDanHasilPanenPage()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: height * 0.265,
                      width: w * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 243, 243, 243),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.green.withOpacity(0.5),
                                blurRadius: 3,
                                spreadRadius: 1,
                                offset: const Offset(1, 2))
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
                              "Hitung Modal\n& Hasil",
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
              ),
               SizedBox(height: height * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: InkWell(
                  onTap: () {
                    _showReminderDialog(context);
                  },
                  child: Container(
                    height: height * 0.085,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green.shade100),
                      color: const Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            blurRadius: 3,
                            spreadRadius: 1,
                            offset: const Offset(1, 2))
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/notification.png",
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(width: 20,),
                          Text(
                            "Pengingat Penyiraman Tanaman",
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan dialog pengingat penyiraman
  void _showReminderDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReminderDialog(); // Use the custom dialog
      },
    );
  }
}
