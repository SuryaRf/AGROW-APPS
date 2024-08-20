import 'package:agriplant/pages/home_page.dart';
import 'package:agriplant/pages/number_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
               SizedBox(height: height * 0.2),
              ConstrainedBox(
                constraints:  BoxConstraints(maxWidth: height * 0.5),
                child: Image.asset('assets/onboard.png'),
              ),
               SizedBox(height: height * 0.13),
              Text('Agrow Application',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "Dapatkan Pupuk Organik Cair Hanya dari Rumah dan Pantau Pertumbuhan Tanaman Anda dengan Mudah Bersama ",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w400), // Gaya umum untuk teks
                    children: <TextSpan>[
                      TextSpan(
                        text: "Agrow",
                        style: GoogleFonts.poppins(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15), // Gaya khusus untuk "Agrow"
                      ),
                      TextSpan(
                        text: ".",
                      ),
                    ],
                  ),
                ),
              ),
              /**/
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(
                        builder: (context) => const HomePage()));
                  },
                  child: Container(
                    width: width * 0.85,
                    height: height * 0.054,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, top: 3, bottom: 3),
                          child: Image.asset('assets/google.png',
                              height: 20, width: 20),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(
                              right: 5, top: 3, bottom: 3),
                          child: Text("Masuk Dengan Google"),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(
                        builder: (context) => const NumberPage()));
                  },
                  child: Container(
                    width: width * 0.85,
                    height: height * 0.054,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, top: 3, bottom: 3),
                          child: Image.asset('assets/phone-call.png',
                              height: 20, width: 20),
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(
                              right: 5, top: 3, bottom: 3),
                          child: Text("Masuk Dengan Nomor Telepon"),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
