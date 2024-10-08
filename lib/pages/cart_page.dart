import 'package:agriplant/data/products.dart';
import 'package:agriplant/pages/payment_page.dart';
import 'package:agriplant/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartItems = products.take(4).toList();
  final Map<int, int> _quantities = {};

  @override
  void initState() {
    super.initState();
    // Initialize quantities
    for (var i = 0; i < cartItems.length; i++) {
      _quantities[i] = 1; // Default quantity is 1
    }
  }

  void incrementQuantity(int index) {
    setState(() {
      _quantities[index] = (_quantities[index] ?? 1) + 1;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if ((_quantities[index] ?? 1) > 1) {
        _quantities[index] = (_quantities[index]! - 1);
      }
    });
  }

  int getTotalItems() {
    return _quantities.values.reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    final total = cartItems
        .asMap()
        .entries
        .map((entry) {
          int index = entry.key;
          var item = entry.value;
          return item.price * (_quantities[index] ?? 1);
        })
        .reduce((value, element) => value + element)
        .toStringAsFixed(3);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pembelian',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green.shade50,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.green.shade300, // Warna border bawah
            height: 1.0, // Tinggi border
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ...List.generate(
              cartItems.length,
              (index) {
                final cartItem = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: CartItem(cartItem: cartItem)),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => decrementQuantity(index),
                          ),
                          Text('${_quantities[index] ?? 1}'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => incrementQuantity(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
             SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Total (${getTotalItems()} items)"), // Updated to display total items
                Text(
                  "Rp.$total",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
             SizedBox(height: height * 0.02),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentPage(
                        cartItems: cartItems,
                        quantities: _quantities,
                      ),
                    ),
                  );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                label: const Text("Lanjutkan ke Pembayaran"),
                icon: const Icon(IconlyBold.arrowRight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
