import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({super.key, required this.onTabChange,});
    final Function(int)? onTabChange;

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.all(25),
    child: GNav (
      onTabChange:(velue) => onTabChange!(velue) ,
      backgroundColor: const Color.fromARGB(255, 78, 52, 46),
      mainAxisAlignment: MainAxisAlignment.center,
      activeColor:const Color.fromARGB(255, 255, 255, 255), 
      tabBackgroundColor:const Color.fromARGB(255, 136, 88, 77),
      tabBorderRadius: 24,
      tabActiveBorder: Border.all(color: const Color.fromARGB(255, 165, 113, 75)),

      tabs: const [
      GButton(
            icon:
                Icons.home, // Gunakan 'icon' bukan langsung 'Icon(Icons.home)'
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          ),
//GButton
          GButton(
            icon: Icons.account_circle,
            text: 'Profile',
          ),
//GButton
      ],
    ),//GNav
    );
    
  }
}