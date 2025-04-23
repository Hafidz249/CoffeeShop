import 'package:coffeeshop/Page/cart_page.dart';
import 'package:coffeeshop/component/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:coffeeshop/Page/shop_page.dart';
import 'package:coffeeshop/Page/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    ShopPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    // Mendapatkan tinggi bottom padding untuk navigasi sistem
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    
    return Scaffold(
      backgroundColor: Colors.white,
      // Menggunakan extendBody agar konten diperpanjang di bawah bottom nav
      extendBody: true,
      body: _pages[_selectedIndex],
      // Padding di bottomNavigationBar untuk memberikan ruang bagi tombol navigasi sistem
      bottomNavigationBar: Padding(
        // Tambahkan padding bawah sesuai dengan navigation bar sistem
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
              ),
            ],
          ),
          child: MyBottomNavBar(
            onTabChange: navigateBottomBar,
          ),
        ),
      ),
    );
  }
}


  //     appBar: AppBar(
  //       title: const Text("Home Page"),
  //     ),
  //     body: const Center(
  //       child: Text("Welcome to Home Page"),
  //     ),
  //   );
  // }

