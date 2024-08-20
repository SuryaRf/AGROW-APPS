import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'otp_page.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  final TextEditingController _phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = "";

  Future<void> _verifyPhoneNumber() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneController.text.trim(), // Trim whitespace
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Phone number automatically verified and user signed in: ${_auth.currentUser?.uid}')),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Verification failed. Code: ${e.code}. Message: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) async {
          setState(() {
            _verificationId = verificationId;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpPage(verificationId: _verificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to Verify Phone Number: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/farmers.png"),
                SizedBox(height: height * 0.06),
                const Text(
                  "MASUK DENGAN NOMOR TELEPON",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: height * 0.03),
                const Text(
                  "Masukkan Nomor Telepon Anda untuk Melanjutkan, Kami Akan Mengirimkan Kode OTP Untuk Verifikasi",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.02),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nomor Telepon',
                  ),
                ),
                SizedBox(height: height * 0.03),
                ElevatedButton(
                  onPressed: _verifyPhoneNumber,
                  child: const Text('Kirim OTP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
