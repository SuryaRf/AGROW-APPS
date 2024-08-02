import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:badges/badges.dart' as badges;
import 'package:agriplant/data/products.dart';
import 'package:agriplant/widgets/product_card.dart';
import 'package:agriplant/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 15,left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Halo AFriends 👋🏾",
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              Text("Apa yang ingin kamu lakukan?",
                  style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 15),
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
                  badgeColor: Colors.green,
                ),
                child: const Icon(IconlyBroken.notification),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 15),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: TextField(
          //           decoration: InputDecoration(
          //             hintText: "Search here...",
          //             isDense: true,
          //             contentPadding: const EdgeInsets.all(12.0),
          //             border: const OutlineInputBorder(
          //               borderSide: BorderSide(),
          //               borderRadius: BorderRadius.all(
          //                 Radius.circular(99),
          //               ),
          //             ),
          //             enabledBorder: OutlineInputBorder(
          //               borderSide: BorderSide(
          //                 color: Colors.grey.shade300,
          //               ),
          //               borderRadius: const BorderRadius.all(
          //                 Radius.circular(99),
          //               ),
          //             ),
          //             prefixIcon: const Icon(IconlyLight.search),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 12),
          //         child: IconButton.filled(onPressed: () {}, icon: const Icon(IconlyLight.filter)),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 5),
            child: SizedBox(
              height: 190,
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
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.green.shade700,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Text("Kembangkan Tanaman Anda Dengan Bantuan Fitur Kami"),
                            FilledButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(initialPageIndex: 1),
                                  ),
                                );
                              },
                              child: const Text("Pantau Sekarang"),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/farmer2.png',
                        width: 160,
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
    );
  }
}
