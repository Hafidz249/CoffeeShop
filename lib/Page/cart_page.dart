import 'package:coffeeshop/Models/coffee.dart';
import 'package:coffeeshop/Models/coffee_shop.dart';
import 'package:coffeeshop/component/coffe_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

 //remove item from cart
 void removeFromCart(Coffee coffee){
  Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
 }
  //pay button tapped
  void payNow(){
    /*
     fill out your payment service here    
    */
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    
    // Ukuran responsif
    final double padding = screenWidth * 0.05; // 5% dari lebar layar
    final double titleFontSize = screenWidth * 0.06 > 24 ? 24 : screenWidth * 0.06; // Maksimal 24
    final double buttonFontSize = screenWidth * 0.045 > 18 ? 18 : screenWidth * 0.045; // Maksimal 18
    final double buttonPadding = screenHeight * 0.025; // 2.5% dari tinggi layar
    
    return Consumer<CoffeeShop>(
      builder:(context, value, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column (
            children: [
              // heading 
              Text(
                'Your Cart', 
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold
                ),
              ),
               
              //list of cart item
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    //get individual cart item
                    Coffee eachCoffee = value.userCart[index];

                    //return coffee tile
                    return CoffeeTile(
                      coffee: eachCoffee, 
                      onPressed: () => removeFromCart(eachCoffee), 
                      icon: Icon(Icons.delete),
                    );
                  },
                ),
              ),

              //pay button 
              GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: EdgeInsets.all(buttonPadding),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text(
                      "Pay Now", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: buttonFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
    