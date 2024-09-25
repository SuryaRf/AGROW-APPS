import 'package:agriplant/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;

  // Daftar halaman untuk onboarding
  final List<Map<String, String>> _onboardingPages = [
    {
      "title": "Selamat Datang di Agrow",
      "description":
          "Aplikasi yang mendukung pertumbuhan tanaman Anda secara berkelanjutan.",
      "image": "assets/agrow.png"
    },
    {
      "title": "Tracking Pertumbuhan Tanaman",
      "description":
          "Pantau pertumbuhan tanaman Anda setiap hari, mulai dari penyiraman hingga pencatatan usia tanaman.",
      "image": "assets/onboarding2.png"
    },
    {
      "title": "Konsultasi Chatbot",
      "description":
          "Dapatkan saran dan konsultasi tentang tanaman melalui chatbot cerdas berbasis AI.",
      "image": "assets/bot.png"
    },
    {
      "title": "Deteksi Penyakit Tanaman",
      "description":
          "Gunakan teknologi machine learning untuk mendeteksi penyakit pada tanaman Anda.",
      "image": "assets/onboarding4.png"
    },
  ];

  // Berpindah ke halaman berikutnya
  void _nextPage() {
    if (_currentIndex < _onboardingPages.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Konten Onboarding
            Padding(
              padding: EdgeInsets.only(top: height * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _onboardingPages[_currentIndex]["image"]!,
                    height: height * 0.3,
                  ),
                  SizedBox(height: height * 0.05),
                  Text(
                    _onboardingPages[_currentIndex]["title"]!,
                    style: GoogleFonts.poppins(
                        fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.1, vertical: height * 0.02),
                    child: Text(
                      _onboardingPages[_currentIndex]["description"]!,
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // Bola Navigasi
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _onboardingPages.length,
                (index) => Padding(
                  padding: EdgeInsets.all(4.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 12,
                    width: _currentIndex == index ? 24 : 12,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? const Color(0xFF66BB6A)
                          : const Color(0xFFC8E6C9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),

            // Tombol Selanjutnya
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.05),
              child: InkWell(
                onTap: _nextPage,
                child: Container(
                  height: height * 0.07,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF66BB6A),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Selanjutnya",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
