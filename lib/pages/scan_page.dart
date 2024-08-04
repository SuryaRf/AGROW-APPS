import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Tanaman'),
        centerTitle: true,
        backgroundColor: Colors.green.shade50,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.green.shade300,
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/scantomat.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/scan.png",
                      color: Colors.green.shade200,
                      height: 350,
                      width: 350,
                    ),
                  ),
                  Positioned(
                    top: 372,
                    left: 39,
                    child: Center(
                      child: Container(
                        height: 175,
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.green.withOpacity(0.4),
                              Colors.white.withOpacity(0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(Icons.image_outlined, color: Colors.green),
                    onPressed: () {
                      // Aksi ketika tombol info ditekan
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi ketika tombol scan ditekan
                    },
                    child: Icon(
                      IconlyLight.scan,
                      color: Colors.white,
                      size: 20,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(side: BorderSide(color: Colors.grey)),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.green,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.help_outline, color: Colors.green),
                    onPressed: () {
                      // Aksi ketika tombol help ditekan
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
