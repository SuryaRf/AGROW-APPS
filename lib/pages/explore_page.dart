import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:badges/badges.dart' as badges;
import 'package:agriplant/data/products.dart';
import 'package:agriplant/widgets/product_card.dart';
import 'package:agriplant/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'premium_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(top: height * 0.015, left: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Halo AFriends 👋🏾",
                style: GoogleFonts.poppins()
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text("Apa yang ingin kamu lakukan?",
                  style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(right: width * 0.03, top: height * 0.015),
                child: IconButton.filledTonal(
                  onPressed: () {},
                  icon: badges.Badge(
                    badgeContent: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    position: badges.BadgePosition.topEnd(top: -15, end: -12),
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: Color(0xFF4CAF50),
                    ),
                    child: const Icon(IconlyBroken.notification),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: width * 0.03, top: height * 0.015),
                child: IconButton.filledTonal(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PremiumPage()));
                  },
                  icon: const Text("PRO +"),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: height * 0.025, left: width * 0.005),
              child: SizedBox(
                height: height * 0.23,
                child: Card(
                  color: Colors.green.shade50,
                  elevation: 0.1,
                  shadowColor: Colors.green.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pantau Tanaman Anda",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Color(0xFF388E3C),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const Text(
                                  "Kembangkan Tanaman Anda Dengan Bantuan Fitur Kami"),
                              FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  minimumSize: const Size.fromHeight(43),
                                  // s Tambahkan ukuran minimal untuk tinggi
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HomePage(initialPageIndex: 1),
                                    ),
                                  );
                                },
                                child: const Text("Pantau Sekarang",
                                    style: TextStyle(fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/farmer2.png',
                          width: width * 0.35,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Produk Kami",
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("Lihat Semua"),
                ),
              ],
            ),
            GridView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ProductCard(product: products[index]),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
