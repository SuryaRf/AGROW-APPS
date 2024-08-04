import 'package:agriplant/pages/orders_page.dart';
import 'package:agriplant/pages/seting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'aboutus_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                foregroundImage: AssetImage('assets/profile.jpg',),
              ),
            ),
          ),
          Center(
            child: Text(
              "Pengguna Agrow",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Center(
            child: Text(
              "agrow.com",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text("Pesanan saya"),
            leading: const Icon(IconlyLight.bag),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersPage(),
                  ));
            },
          ), ListTile(
            title: const Text("Pengaturan"),
            leading: const Icon(IconlyLight.setting),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
          ListTile(
            title: const Text("Tentang kami"),
            leading: const Icon(IconlyLight.infoSquare),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsPage()));
            },
          ),
          ListTile(
            title: const Text("Keluar"),
            leading: const Icon(IconlyLight.logout),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
