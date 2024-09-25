import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumPage2 extends StatefulWidget {
  const PremiumPage2({super.key});

  @override
  State<PremiumPage2> createState() => _PremiumPage2State();
}

class _PremiumPage2State extends State<PremiumPage2> {
  // Track the selected package
  int _selectedPackage = 0;

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.cancel_outlined, size: height * 0.04)),
                  Image.asset("assets/PRO.png", height: height * 0.05),
                ],
              ),
            ),
            Image.asset(
              "assets/bot.png",
              height: height * 0.2,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.1, left: width * 0.06, right: width * 0.06),
              child: Text(
                "Pilih Paket untuk\nLangganan PRO+ Kalian",
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.06, top: height * 0.05, right: width * 0.06),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedPackage = 1;
                  });
                },
                child: Container(
                  height: height * 0.1,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: _selectedPackage == 1
                        ? const Color(0xFF66BB6A) // Highlight color for selected package
                        : const Color(0xFFA8FAAB),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _selectedPackage == 1
                          ? Colors.green.withOpacity(0.8)
                          : Colors.black.withOpacity(.2),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Paket\nSimpel",
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.05),
                          child: Text("Rp 30.000 / Bulan",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.06, top: height * 0.03, right: width * 0.06),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedPackage = 2;
                  });
                },
                child: Container(
                  height: height * 0.13,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    color: _selectedPackage == 2
                        ? const Color(0xFF66BB6A) // Highlight color for selected package
                        : const Color(0xFFA8FAAB),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _selectedPackage == 2
                          ? Colors.green.withOpacity(0.8)
                          : Colors.green.withOpacity(0.5),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Paket\nHemat",
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: EdgeInsets.only(left: width * 0.05),
                          child: Text("Rp 80.000 / 3 Bulan",
                              style: GoogleFonts.poppins(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.15),
              child: InkWell(
                onTap: () {
                  _showPaymentSuccessDialog(context);
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      color: const Color(0xFFA8FAAB),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ]),
                  child: Center(
                    child: Text(
                      "LANJUTKAN",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF388E3C)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.025),
              child: Text(
                "LIHAT SEMUA PAKET",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 50,
          ),
          content: const Text(
            "Pembayaran Berhasil!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
