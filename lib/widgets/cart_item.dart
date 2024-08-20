import 'dart:async';
import 'dart:math';

import 'package:agriplant/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});

  final Product cartItem;

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: const Icon(
          IconlyLight.delete,
          color: Colors.white,
          size: 25,
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        final completer = Completer<bool>();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: "Batalkan",
              onPressed: () {
                completer.complete(false);
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              },
            ),
            content: const Text(
              "Hapus dari keranjang?",
            ),
          ),
        );
        Timer(const Duration(seconds: 3), () {
          if (!completer.isCompleted) {
            completer.complete(true);
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
          }
        });

        return await completer.future;
      },
      child: SizedBox(
        height: height * 0.17,
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.green.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          elevation: 0.1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: width * 0.23,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(cartItem.image),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItem.name,
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 2),
                      Text(
                        cartItem.description,
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rp.${cartItem.price.toStringAsFixed(3)}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
