import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
   bool isScanCompleted = false;
  bool isFlashOn = false;
  bool isFrontCamera = false;
  void closeScreen() {
    isScanCompleted = false;
  }
  bool isGateOpen = false;

  MobileScannerController controller = MobileScannerController();
  @override
  Widget build(BuildContext context) {
     final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)),
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Scan Kesehatan Tanaman",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isFlashOn = !isFlashOn;
              });
              controller.toggleTorch();
            },
            child: Icon(
              Icons.flash_on,
              color: isFlashOn ? Colors.green : Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isFrontCamera = !isFrontCamera;
              });
              controller.switchCamera();
            },
            child: Icon(
              Icons.camera_front_outlined,
              color: isFrontCamera ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Silahkan Arahkan Kamera\nAnda ke Tanaman",
                        style:  TextStyle(
                            color:  Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.05),
                        child: const Text(
                          "Proses Scan Akan Dimulai Otomatis",
                          style: TextStyle(
                            color:  Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 12,
                           ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Expanded(
                child: Stack(
                  children: [
                    MobileScanner(
                      controller: controller,
                      onDetect: (capture) async {
                        if (isScanCompleted) return;
                        final List<Barcode> barcodes = capture.barcodes;
                        if (barcodes.isNotEmpty) {
                          final String? data = barcodes.first.rawValue;

                          if (data != null) {
                            isScanCompleted = true;
                            
                            // Kirim status True atau False berdasarkan apakah gate sudah terbuka atau belum
                            // await sendDataToServer(
                            //     data, isGateOpen ? "False" : "True");

                            // Toggle status gate
                            isGateOpen = !isGateOpen;

                            // Reset scan completion status setelah beberapa detik
                            Future.delayed(const Duration(seconds: 3), () {
                              setState(() {
                                isScanCompleted = false;
                              });
                            });
                          }
                        }
                      },
                    ),
                    QRScannerOverlay(overlayColor: Colors.black.withOpacity(0.5)),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Dikembangkan oleh AGROW",
                    style: TextStyle(
                            color:  Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



// Fungsi untuk mengirim data ke server
  // Future<void> sendDataToServer(String url, String status) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode({"data": status}),  // Mengirim status True atau False
  //     );

  //     if (response.statusCode == 200) {
  //       print("Gate ${status == 'True' ? 'opened' : 'closed'} successfully");
  //     } else {
  //       print("Failed to update gate: ${response.body}");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }
}
