import 'package:coffeeshop/Models/coffee.dart';
import 'package:coffeeshop/Models/coffee_shop.dart';
import 'package:coffeeshop/component/coffe_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    
    // Menentukan ukuran berdasarkan layar
    final double paddingAll = screenWidth * 0.05; // 5% dari lebar layar
    final double titleFontSize = screenWidth * 0.06 > 24 ? 24 : screenWidth * 0.06; // Maksimal 24
    final double spacerHeight = screenWidth * 0.05; // 5% dari lebar layar
    
    // Menghitung padding bottom untuk mencegah konten tertutup navigation bar
    final bottomNavHeight = 80.0; // Perkiraan tinggi nav bar (bisa disesuaikan)
    
    return Consumer<CoffeeShop>(
      builder: (context, value, child) {
        return SafeArea(
          bottom: false, // Abaikan safe area bottom karena kita menangani manual
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              paddingAll, 
              paddingAll, 
              paddingAll, 
              paddingAll + bottomNavHeight
            ),
            child: Column(
              children: [
                Text(
                  'Menu Kopi',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: spacerHeight),

                // List of coffee
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 20), // Extra padding di akhir list
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      // Get individual coffee
                      Coffee coffee = value.coffeeShop[index];

                      // Return coffee tile
                      return CoffeeTile(
                        coffee: coffee,
                        onPressed: () => value.addCoffeeToCart(coffee),
                        icon: const Icon(Icons.add),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
