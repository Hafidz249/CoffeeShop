import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key, 
    required this.onTabChange,
  });
  
  final Function(int)? onTabChange;

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    
    // Ukuran responsif
    final double iconSize = screenWidth * 0.06 > 24 ? 24 : screenWidth * 0.06; // Maksimal 24
    final double textSize = screenWidth * 0.035 > 14 ? 14 : screenWidth * 0.035; // Maksimal 14
    final double buttonPadding = screenWidth * 0.035; // 3.5% dari lebar layar
    
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 78, 52, 46),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        backgroundColor: const Color.fromARGB(255, 78, 52, 46),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        activeColor: const Color.fromARGB(255, 255, 255, 255), 
        tabBackgroundColor: const Color.fromARGB(255, 136, 88, 77),
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: const Color.fromARGB(255, 165, 113, 75)),
        padding: EdgeInsets.symmetric(horizontal: buttonPadding, vertical: 8),
        gap: 8,
        iconSize: iconSize,
        textStyle: TextStyle(
          fontSize: textSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          ),
          GButton(
            icon: Icons.account_circle,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}