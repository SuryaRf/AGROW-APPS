import 'package:agriplant/data/products.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../models/product.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late TapGestureRecognizer readMoreGestureRecognizer;
  bool showMore = false;

  @override
  void initState() {
    super.initState();
    readMoreGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          showMore = !showMore;
        });
      };
  }

  @override
  void dispose() {
    super.dispose();
    readMoreGestureRecognizer.dispose();
  }

  @override
Widget build(BuildContext context) {
      final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    final width = MediaQuery.of(context).size.width;
  return Scaffold(
    appBar: AppBar(
      title: const Text("Detail"),
    ),
    body: SafeArea(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                height: height * 0.3,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.product.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Text(
                widget.product.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stok tersedia",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Rp${widget.product.price.toStringAsFixed(3)}",
                            style: Theme.of(context).textTheme.titleMedium),
                        TextSpan(
                            text: "/${widget.product.unit}",
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.yellow.shade800,
                  ),
                  Text(
                    "${widget.product.rating} (192)",
                  ),
                  const Spacer(),
                  SizedBox(
                    height: height * 0.04,
                    width: width * 0.08,
                    child: IconButton.filledTonal(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      iconSize: 18,
                      icon: const Icon(Icons.remove),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      widget.product.unit,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  SizedBox(
                     height: height * 0.04,
                    width: width * 0.08,
                    child: IconButton.filledTonal(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      iconSize: 18,
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
               SizedBox(height: height * 0.025),
              Text("Deskripsi",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: showMore
                          ? widget.product.description
                          : '${widget.product.description.substring(0, widget.product.description.length - 100)}...',
                    ),
                    TextSpan(
                      recognizer: readMoreGestureRecognizer,
                      text: showMore ? " Lebih sedikit" : " Lebih banyak",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
                  ],
                ),
              ),
               SizedBox(height: height * 0.025),
              Text(
                "Produk sejenis",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
               SizedBox(height: height * 0.01),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: height * 0.1,
                      width: width * 0.26,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(products[index].image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                  separatorBuilder: (__, _) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: products.length,
                ),
              ),
               SizedBox(height: height * 0.08), // Menambahkan jarak untuk tombol di bawah
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.transparent,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50), // Tambahkan ukuran minimal untuk tinggi
                ),
                onPressed: () {},
                icon: const Icon(IconlyLight.bag2),
                label: const Text("Tambahkan ke keranjang"),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}
