import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:agriplant/data/products.dart';
import '../models/product.dart';

class PaymentPage extends StatelessWidget {
  final List<Product> cartItems;
  final Map<int, int> quantities;

  PaymentPage({required this.cartItems, required this.quantities});

  int getTotalItems() {
    return quantities.values.reduce((a, b) => a + b);
  }

  double getTotalPrice() {
    return cartItems.asMap().entries.map((entry) {
      int index = entry.key;
      var item = entry.value;
      return item.price * (quantities[index] ?? 1);
    }).reduce((value, element) => value + element);
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    double subtotal = getTotalPrice();
    double shipping = 20; // Example shipping cost
    double serviceFee = 1; // Example service fee
    double total = subtotal + shipping + serviceFee;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pembayaran"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Address section
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 222, 241, 223),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Alamat Pengiriman:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Icon(Icons.arrow_right_sharp)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Jl. Contoh No. 123, Jakarta, Indonesia",
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 20, thickness: 1),

                // Cart items section
                Text(
                  "Item dipilih (${getTotalItems()} items)",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: height * 0.01),
                ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Prevents inner scrolling
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    final quantity = quantities[index] ?? 1;
                    return ListTile(
                      leading: SizedBox(
                        width: width * 0.13,
                        height: height * 0.1,
                        child: Image.asset(
                          item.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(item.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.unit),
                          Text("Jumlah: $quantity"),
                        ],
                      ),
                      trailing: Text(
                          "Rp.${(item.price * quantity).toStringAsFixed(3)}"),
                    );
                  },
                ),
                const Divider(height: 20, thickness: 1),

                // Payment details section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rincian Pembayaran:",
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Subtotal Produk"),
                          Text("Rp.${subtotal.toStringAsFixed(3)}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Subtotal Pengiriman"),
                          Text("Rp.${shipping.toStringAsFixed(3)}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Biaya Layanan"),
                          Text("Rp.${serviceFee.toStringAsFixed(3)}"),
                        ],
                      ),
                      const Divider(height: 20, thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Pembayaran",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rp.${total.toStringAsFixed(3)}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                 SizedBox(height: height * 0.02),

                // Payment methods section
                Text(
                  "Pilih Metode Pembayaran",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                 SizedBox(height: height * 0.01),
                ListTile(
                  title: const Text("Credit Card"),
                  leading:
                      Image.asset("assets/credit.png", height: height * 0.4, width: width * 0.09),
                  onTap: () {
                    // Handle credit card payment logic here
                  },
                ),
                const Divider(
                  height: 10,
                  thickness: 0.5,
                ),
                ListTile(
                  title: const Text("Bank Transfer"),
                  leading:
                      Image.asset("assets/transfer.png", height: height * 0.4, width: width * 0.09),
                  onTap: () {
                    // Handle bank transfer payment logic here
                  },
                ),
                const Divider(
                  height: 10,
                  thickness: 0.5,
                ),
                ListTile(
                  title: const Text("E-Wallet"),
                  leading:
                      Image.asset("assets/ewallet.png", height: height * 0.4, width: width * 0.09),
                  onTap: () {
                    // Handle digital wallet payment logic here
                  },
                ),
                const Divider(
                  height: 10,
                  thickness: 0.5,
                ),
                ListTile(
                  title: const Text("Cash on Delivery"),
                  leading: Image.asset("assets/cod.png", height: height * 0.4, width: width * 0.09),
                  onTap: () {
                    // Handle cash on delivery payment logic here
                  },
                ),
                const Divider(
                  height: 10,
                  thickness: 0.5,
                ),
                const SizedBox(height: 20),

                // Payment confirmation button
                Container(
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.green)),
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Total Pembayaran:",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                          ),
                          Text(
                            "Rp.${total.toStringAsFixed(3)}k",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      FilledButton.icon(
                        onPressed: () {},
                        label: const Text("Konfirmasi\nPembayaran"),
                        icon: const Icon(IconlyBold.arrowRight),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
