import 'package:coffeeshop/Models/coffee.dart';
import 'package:coffeeshop/Models/coffee_shop.dart';
import 'package:coffeeshop/component/coffe_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const Text(
                  'Menu Kopi',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 25),

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
