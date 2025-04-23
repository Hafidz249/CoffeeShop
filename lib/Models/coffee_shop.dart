import 'package:flutter/material.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier {
  //coffeeshop for sale list
  final List<Coffee> _shop = [
    //black coffee
    Coffee(
      name: 'Black',
      price: "4.10",
      imagePath: "assets/images/black.png",
    ),
    //latte
    Coffee(
      name: 'Latte',
      price: "4.10",
      imagePath: "assets/images/latte.png",
    ),
    //espresso
    Coffee(
      name: 'Espresso',
      price: "4.20",
      imagePath: "assets/images/espresso.png",
    ),
    //ice coffee
    Coffee(
      name: 'Ice coffe',
      price: "4.40",
      imagePath: "assets/images/iced_coffee.png",
    ),
  ];
  //user cart
  List<Coffee> _userCart = [];

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addCoffeeToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart - fixed implementation
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
