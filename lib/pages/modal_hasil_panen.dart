import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Import intl package

class ModalDanHasilPanenPage extends StatefulWidget {
  const ModalDanHasilPanenPage({super.key});

  @override
  State<ModalDanHasilPanenPage> createState() => _ModalDanHasilPanenPageState();
}

class _ModalDanHasilPanenPageState extends State<ModalDanHasilPanenPage> {
  // Separate controllers for nama barang
  final TextEditingController _namaBarangModalController = TextEditingController();
  final TextEditingController _namaBarangHasilPanenController = TextEditingController();
  final TextEditingController _modalController = TextEditingController();
  final TextEditingController _hasilPanenController = TextEditingController();

  final List<Map<String, dynamic>> _listPengeluaran = [];
  final List<Map<String, dynamic>> _listHasilPanen = [];
  double _totalModal = 0.0;
  double _totalHasilPanen = 0.0;
  double _keuntungan = 0.0;

  final formatCurrency = NumberFormat('#,##0', 'id_ID'); // Formatter untuk angka

  // Fungsi untuk menambahkan pengeluaran modal dengan nama barang
  void _tambahModal() {
    double modal = double.tryParse(_modalController.text) ?? 0.0;
    String namaBarang = _namaBarangModalController.text; 

    if (modal > 0 && namaBarang.isNotEmpty) {
      setState(() {
        _listPengeluaran.add({
          'namaBarang': namaBarang,
          'modal': modal,
        });
        _totalModal += modal;
        _hitungKeuntungan();
        _modalController.clear();
        _namaBarangModalController.clear(); // Clear modal barang controller
      });
    }
  }

  // Fungsi untuk menambahkan hasil panen
  void _tambahHasilPanen() {
    double hasilPanen = double.tryParse(_hasilPanenController.text) ?? 0.0;
    String namaBarang = _namaBarangHasilPanenController.text; // Menggunakan controller terpisah

    if (hasilPanen > 0 && namaBarang.isNotEmpty) {
      setState(() {
        _listHasilPanen.add({
          'namaBarang': namaBarang,
          'hasilPanen': hasilPanen,
        });
        _totalHasilPanen += hasilPanen;
        _hitungKeuntungan();
        _hasilPanenController.clear();
        _namaBarangHasilPanenController.clear(); // Clear hasil panen barang controller
      });
    }
  }

  // Fungsi untuk menghitung keuntungan
  void _hitungKeuntungan() {
    setState(() {
      _keuntungan = _totalHasilPanen - _totalModal;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perhitungan Modal & Hasil Panen'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Catat Modal & Hasil Panen",
              style: GoogleFonts.poppins().copyWith(
                fontSize: 19,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: height * 0.02),
            TextField(
              controller: _namaBarangModalController, // Controller untuk modal
              decoration: InputDecoration(
                labelText: 'Nama Barang (Modal)',
                labelStyle: GoogleFonts.poppins(),
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(height: height * 0.02),
            TextField(
              controller: _modalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Modal (Rp)',
                labelStyle: GoogleFonts.poppins(),
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(height: height * 0.02),
            ElevatedButton(
              onPressed: _tambahModal,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                backgroundColor: Colors.green,
              ),
              child: Text(
                'Tambah Pengeluaran',
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            TextField(
              controller: _namaBarangHasilPanenController, // Controller untuk hasil panen
              decoration: InputDecoration(
                labelText: 'Nama Barang (Hasil Panen)',
                labelStyle: GoogleFonts.poppins(),
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(height: height * 0.02),
            TextField(
              controller: _hasilPanenController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Hasil Panen (Rp)',
                labelStyle: GoogleFonts.poppins(),
                border: const OutlineInputBorder(),
              ),
            ),
            SizedBox(height: height * 0.02),
            ElevatedButton(
              onPressed: _tambahHasilPanen,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                backgroundColor: Colors.green,
              ),
              child: Text(
                'Tambah Hasil Panen',
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Daftar Modal:",
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Nama Barang')),
                        DataColumn(label: Text('Modal (Rp)')),
                      ],
                      rows: _listPengeluaran
                          .map((item) => DataRow(cells: [
                                DataCell(Text(item['namaBarang'])),
                                DataCell(Text('Rp ${formatCurrency.format(item['modal'])}')), // Format modal
                              ]))
                          .toList(),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "Daftar Hasil Panen:",
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    DataTable(
                      columns: const [
                        DataColumn(label: Text('Nama Barang')),
                        DataColumn(label: Text('Hasil Panen (Rp)')),
                      ],
                      rows: _listHasilPanen
                          .map((item) => DataRow(cells: [
                                DataCell(Text(item['namaBarang'])),
                                DataCell(Text('Rp ${formatCurrency.format(item['hasilPanen'])}')), // Format hasil panen
                              ]))
                          .toList(),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      'Total Modal: Rp ${formatCurrency.format(_totalModal)}', // Format total modal
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Total Hasil Panen: Rp ${formatCurrency.format(_totalHasilPanen)}', // Format total hasil panen
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      'Keuntungan: Rp ${formatCurrency.format(_keuntungan)}', // Format keuntungan
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: _keuntungan >= 0 ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
