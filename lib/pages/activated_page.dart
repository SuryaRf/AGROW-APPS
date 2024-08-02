import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agriplant/pages/onboarding_page.dart';

class ActivatedPage extends StatefulWidget {
  const ActivatedPage({super.key});

  @override
  State<ActivatedPage> createState() => _ActivatedPageState();
}

class _ActivatedPageState extends State<ActivatedPage> {
  final TextEditingController _controller = TextEditingController();
  String _errorText = '';

  Future<void> _verifyActivationCode() async {
    final String enteredCode = _controller.text.trim();

    // Ambil kode aktivasi dari Firebase Firestore
    final querySnapshot = await FirebaseFirestore.instance
        .collection('activationCodes')
        .where('code', isEqualTo: enteredCode)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Kode aktivasi ditemukan
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingPage(),
        ),
      );
    } else {
      // Kode aktivasi tidak ditemukan
      setState(() {
        _errorText = 'Kode aktivasi salah. Coba lagi.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
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
                  child: Image.asset("assets/blob.png", height: 200, width: 200,),
                ),
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
                        color: Color.fromARGB(255, 76, 175, 80),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: "Masukan Kode Aktivasi",
                          isDense: true,
                          contentPadding: EdgeInsets.all(12.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(99),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _verifyActivationCode,
                      child: const Text("Continue"),
                    ),
                    if (_errorText.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          _errorText,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
