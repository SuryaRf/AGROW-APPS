import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:agriplant/pages/explore_page.dart';
import 'package:agriplant/pages/services_page.dart';
import 'package:agriplant/pages/cart_page.dart';
import 'package:agriplant/pages/profile_page.dart';

import 'scan_page.dart';

class HomePage extends StatefulWidget {
  final int initialPageIndex;
  const HomePage({super.key, this.initialPageIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = [
    const ExplorePage(),
    const ServicesPage(),
    const CartPage(),
    const ProfilePage()
  ];
  late int currentPageIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.initialPageIndex;
  }

  void onTabTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          IconlyLight.scan,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(45.0)),
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ScanPage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageStorage(
        bucket: bucket,
        child: pages[currentPageIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green.withOpacity(0.1),
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () => onTabTapped(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      IconlyLight.home,
                      color: currentPageIndex == 0 ? Colors.green : Colors.grey,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: currentPageIndex == 0 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () => onTabTapped(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      IconlyLight.document,
                      color: currentPageIndex == 1 ? Colors.green : Colors.grey,
                    ),
                    Text(
                      "Tracking",
                      style: TextStyle(
                        color: currentPageIndex == 1 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 40), // space for the floating action button
              MaterialButton(
                minWidth: 40,
                onPressed: () => onTabTapped(2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      IconlyLight.buy,
                      color: currentPageIndex == 2 ? Colors.green : Colors.grey,
                    ),
                    Text(
                      "Cart",
                      style: TextStyle(
                        color: currentPageIndex == 2 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () => onTabTapped(3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      IconlyLight.profile,
                      color: currentPageIndex == 3 ? Colors.green : Colors.grey,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: currentPageIndex == 3 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


        // items: const [
        //   BottomNavigationBarItem(
        //     icon: Icon(IconlyLight.home),
        //     label: "Home",
        //     activeIcon: Icon(IconlyBold.home),
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(IconlyLight.document),
        //     label: "Tracking",
        //     activeIcon: Icon(IconlyBold.call),
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(IconlyLight.buy),
        //     label: "Cart",
        //     activeIcon: Icon(IconlyBold.buy),
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(IconlyLight.profile),
        //     label: "Profile",
        //     activeIcon: Icon(IconlyBold.profile),
        //   ),
        // ],

//  bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentPageIndex,
//         onTap: (index) {
//           setState(() {
//             currentPageIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(IconlyLight.home),
//             label: "Home",
//             activeIcon: Icon(IconlyBold.home),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(IconlyLight.document),
//             label: "Tracking",
//             activeIcon: Icon(IconlyBold.call),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(IconlyLight.buy),
//             label: "Cart",
//             activeIcon: Icon(IconlyBold.buy),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(IconlyLight.profile),
//             label: "Profile",
//             activeIcon: Icon(IconlyBold.profile),
//           ),
//         ],
//       ),