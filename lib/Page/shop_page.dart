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
    
    return Consumer<CoffeeShop>(
      builder: (context, value, child) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(paddingAll),
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
