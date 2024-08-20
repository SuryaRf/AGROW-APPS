import 'package:agriplant/pages/activated_page.dart';
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
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: height * 0.03, bottom: height * 0.015),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                foregroundImage: AssetImage(
                  'assets/farmer.png',
                ),
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
           SizedBox(height: height * 0.03),
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
          ),
          ListTile(
            title: const Text("Pengaturan"),
            leading: const Icon(IconlyLight.setting),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
          ),
          ListTile(
            title: const Text("Tentang kami"),
            leading: const Icon(IconlyLight.infoSquare),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutUsPage()));
            },
          ),
          ListTile(
            title: const Text("Keluar"),
            leading: const Icon(IconlyLight.logout),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ActivatedPage()));
            },
          ),
        ],
      ),
    );
  }
}
