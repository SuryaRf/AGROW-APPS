import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan"),
      ),
      body: ListView(
        children: [

          ListTile(
            title: const Text("Alamat Saya"),
            leading: const Icon(Icons.pin_drop_outlined),
            trailing:const Icon(Icons.arrow_right),
            onTap: () {
              // Aksi saat menekan opsi Notifikasi
            },
          ),
            ListTile(
            title: const Text("Akun & Keamanan"),
            leading: const Icon(Icons.lock),
            trailing:const Icon(Icons.arrow_right),
            onTap: () {
              // Aksi saat menekan opsi Privasi
            },
          ),
          ListTile(
            title: const Text("Notifikasi"),
            leading: const Icon(Icons.notifications_none_sharp),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {
                // Implementasi pengaturan notifikasi
              },
            ),
            onTap: () {
              // Aksi saat menekan opsi Notifikasi
            },
          ),
          ListTile(
            title: const Text("Tema"),
            leading: const Icon(Icons.mode_night_outlined),
            trailing: DropdownButton<String>(
              value: "Terang",
              items: const [
                DropdownMenuItem(
                  value: "Terang",
                  child: Text("Terang"),
                ),
                DropdownMenuItem(
                  value: "Gelap",
                  child: Text("Gelap"),
                ),
                DropdownMenuItem(
                  value: "Sistem",
                  child: Text("Sistem"),
                ),
              ],
              onChanged: (String? value) {
                // Implementasi pengaturan tema
              },
            ),
            onTap: () {
              // Aksi saat menekan opsi Tema
            },
          ),
          ListTile(
            title: const Text("Bahasa"),
            leading: const Icon(Icons.language),
            trailing: DropdownButton<String>(
              value: "Indonesia",
              items: const [
                DropdownMenuItem(
                  value: "Indonesia",
                  child: Text("Indonesia"),
                ),
                DropdownMenuItem(
                  value: "English",
                  child: Text("English"),
                ),
                // Tambahkan bahasa lain sesuai kebutuhan
              ],
              onChanged: (String? value) {
                // Implementasi pengaturan bahasa
              },
            ),
            onTap: () {
              // Aksi saat menekan opsi Bahasa
            },
          ),
        
          ListTile(
            title: const Text("Bantuan & Dukungan"),
            leading: const Icon(Icons.call),
            trailing:const Icon(Icons.arrow_right),
            onTap: () {
              // Aksi saat menekan opsi Bantuan & Dukungan
            },
          ),
          ListTile(
            title: const Text("Suka Agrow? Nilai Kami!"),
            leading: const Icon(Icons.star_border),
            trailing:const Icon(Icons.arrow_right),
            onTap: () {
              // Aksi saat menekan opsi Bantuan & Dukungan
            },
          ),
        ],
      ),
    );
  }
}
