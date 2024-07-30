import 'package:agriplant/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivatedPage extends StatefulWidget {
  const ActivatedPage({super.key});

  @override
  State<ActivatedPage> createState() => _ActivatedPageState();
}

class _ActivatedPageState extends State<ActivatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(232, 245, 233, 1), // Top color
                Colors.white, // Bottom color
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
                Positioned(
                  top: -20,
                  left: -60,
                  child: Image.asset("assets/blob.png", height: 200, width: 200,)),
              
              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/iconfarm.png"),
                Text(
                  "WELCOME TO AGROW",
                  style: GoogleFonts.poppins().copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                ),
                const SizedBox(height: 20), // Add spacing between elements
                const SizedBox(
                  width: 200, // Set a specific width for the TextField
                  child: TextField(
                    decoration: InputDecoration(
                      
                      hintText: "Masukan Kode Aktivasi",
                      
                      isDense: true,
                      contentPadding:  EdgeInsets.all(12.0),
                      border:  OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(
                          Radius.circular(99),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Add spacing between elements
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingPage(),
                      ),
                    );
                  },
                  child: const Text("Continue"),
                ),
              ],
            ),
            ]
          ),
        ),
      ),
    );
  }
}
