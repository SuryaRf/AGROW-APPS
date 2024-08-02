import 'package:agriplant/data/products.dart';
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
    final total = cartItems.asMap().entries.map((entry) {
      int index = entry.key;
      var item = entry.value;
      return item.price * (_quantities[index] ?? 1);
    }).reduce((value, element) => value + element).toStringAsFixed(2);

    return Scaffold(
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total (${getTotalItems()} items)"), // Updated to display total items
                Text(
                  "Rp.${total}k",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {},
                label: const Text("Proceed to Checkout"),
                icon: const Icon(IconlyBold.arrowRight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
