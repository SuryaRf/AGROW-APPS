import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import paket intl

class AddPlant extends StatefulWidget {
  @override
  State<AddPlant> createState() => _AddPlantState();
}

class _AddPlantState extends State<AddPlant> {
  final TextEditingController _plantController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  String _selectedType = 'Kacang Panjang'; // Default value for dropdown
  final List<String> _plantTypes = [
    'Kacang Panjang',
    'tomat',
    'Selada Merah',
    'Tanaman Caisim',
    'Selada Romaine',
    'Bayam Merah',
    'Cabai Rawit',
    'Bayam Hijau',
    'Kangkung',
    'Kelapa Sawit',
    'Bibit Kopi',
    'Bibit Kakao',
    'Bit Merah',
    'Kedelai Edamame',
    'Mentimun',
    'Selada Hijau',
    'Bawang Merah',
    'Sorgum',
    'Kailan',
    'Selada',
    'Cabai Besar',
    'Cabai Merah',
    'Tanaman Akra',
  ];

  Timestamp getCurrentTimestamp() {
    DateTime now = DateTime.now();
    return Timestamp.fromDate(now);
  }

  @override
  Widget build(BuildContext context) {
    Timestamp date = getCurrentTimestamp();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(IconlyLight.plus),
        onPressed: () async {
          // Add new plant
          DocumentReference docRef =
              await FirebaseFirestore.instance.collection("plants").add({
            "name": _plantController.text,
            "img": "assets/services/${_selectedType}.jpg",
            "creation_date": date,
            "note": _noteController.text
          });

          // Add sub-collection 'check_ins'
          await docRef.collection('check_ins').add({
            'initial_check': getCurrentTimestamp(),
            'status': 'not checked'
          });

          Navigator.pop(context);
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Tambahkan Tanaman",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
              ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Tambahkan Tanaman Anda",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  DateFormat('yyyy-MM-dd HH:mm')
                      .format(date.toDate()), // Display formatted date
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _plantController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama Tanaman",
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Jenis Tanaman",
                ),
                items: _plantTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedType = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _noteController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Catatan",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
