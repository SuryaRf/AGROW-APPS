import 'dart:math';

import 'package:agriplant/data/orders.dart';
import 'package:agriplant/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
        final height =
        MediaQuery.of(context).size.height - AppBar().preferredSize.height;

    
    final tabs = ['Proses', 'Pengemasan', 'Dikirim', 'Sampai'];

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pesanan Saya"),
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: List.generate(tabs.length, (index) {
              return Tab(
                text: "${tabs[index]} ${Random().nextInt(10)}",
              );
            }),
          ),
        ),
        body: TabBarView(
          children: List.generate(
            tabs.length,
            (index) {
              return ListView(
                padding: const EdgeInsets.all(16),
                children: List.generate(
                  orders.length,
                  (index) {
                    return Padding(
                      padding:  EdgeInsets.only(bottom: height * 0.02),
                      child: OrderItem(order: orders[index]),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
