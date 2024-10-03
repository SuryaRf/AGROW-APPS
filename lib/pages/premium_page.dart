import 'package:agriplant/pages/premium_page2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
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
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.1, left: width * 0.06, right: width * 0.06),
              child: Text(
                "Dapatkan Akses Penuh Untuk Mendukung\nPerkembangan Tanaman Anda dengan PRO +",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: width * 0.06, top: height * 0.05, right: width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: width * 0.47, top: height * 0.01),
                    child: Text("GRATIS", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: width * 0.03),
                    child: Image.asset("assets/PRO.png", height: height * 0.03),
                  )
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: width * 0.06, top: height * 0.05, right: width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Akses Artikel\nAgrow", style: GoogleFonts.poppins(fontSize: 14, )),
                  Padding(
                    padding:  EdgeInsets.only(left: width * 0.05),
                    child: const Icon(Icons.done),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: width * 0.08),
                    child: const Icon(Icons.done),
                  )
                ],
              ),
            ),
                        Divider(height: height * 0.05, color: Colors.grey,endIndent: width * 0.07, indent: width * 0.06,),

            Padding(
              padding:  EdgeInsets.only(left: width * 0.06, right: width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Akses Tracking\nPerkembangan\nTanaman", style: GoogleFonts.poppins(fontSize: 14, )),
                  Padding(
                    padding:  EdgeInsets.only(left: width * 0.05),
                    child: const Icon(Icons.done),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: width * 0.08),
                    child: const Icon(Icons.done),
                  )
                ],
              ),
            ),
            Divider(height: height * 0.05, color: Colors.grey,endIndent: width * 0.07, indent: width * 0.06,),
            Padding(
              padding:  EdgeInsets.only(left: width * 0.06, right: width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Akses Chatbot\nTak Terbatas", style: GoogleFonts.poppins(fontSize: 14, )),
                  Padding(
                    padding:  EdgeInsets.only(left: width * 0.05),
                    child: const Icon(Icons.minimize_outlined),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: width * 0.08),
                    child: const Icon(Icons.done),
                  )
                ],
              ),
            ),
             Divider(height: height * 0.05, color: Colors.grey,endIndent: width * 0.07, indent: width * 0.06,),
            Padding(
              padding:  EdgeInsets.only(left: width * 0.06, right: width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bebas Iklan", style: GoogleFonts.poppins(fontSize: 14, )),
                  Padding(
                    padding:  EdgeInsets.only(left: width * 0.1),
                    child: const Icon(Icons.minimize_outlined),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: width * 0.08, top: height * 0.01),
                    child: const Icon(Icons.done),
                  ),
                  
                ],
              ),
            ),
             Divider(height: height * 0.05, color: Colors.grey,endIndent: width * 0.07, indent: width * 0.06,),
            Padding(
              padding:  EdgeInsets.only(left: width * 0.06, right: width * 0.09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fitur Pendeteksi\nPenyakit\nTanaman", style: GoogleFonts.poppins(fontSize: 14, )),
                  Padding(
                    padding:  EdgeInsets.only(left: width * 0.07),
                    child: const Icon(Icons.minimize_outlined),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: width * 0.05, top: height * 0.01, left: width * 0.05),
                    child: const Icon(Icons.done),
                  ),
                  
                ],
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(top: height * 0.07),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PremiumPage2()));
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
                    ]
                  ),
                  child: Center(
                    child: Text(
                      "DAPATKAN PRO+ AGROW",
                      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF388E3C)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
