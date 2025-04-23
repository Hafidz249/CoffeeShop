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
     fill out yourr payment servis here    
    */
  }

  @override
  Widget build(BuildContext context) {
  return Consumer<CoffeeShop>(
    builder:(context, value, child) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column (
        children: [
         // heading 
          Text('Your Cart', style: TextStyle(fontSize: 20),
          ),
           
           //list of cart item
           Expanded(child: ListView.builder(
            itemCount: value.userCart.length,
            itemBuilder: (context, index) {
           //get individual cart item
           Coffee eachCoffee = value.userCart[index];


           //return coffee tile
           return CoffeeTile(coffee: eachCoffee, onPressed: () => removeFromCart(eachCoffee), icon: Icon(Icons.delete),
           );
           },
           ),
           ),

            //pay button 
             GestureDetector(
              onTap: payNow,
               child: Container(
                padding: const EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12)
                ),
                child: const Center(
                  child: Text(
                    "Pay Now", 
                    style: TextStyle(color: Colors.white)),
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
    