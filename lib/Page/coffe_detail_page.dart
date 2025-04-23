import 'package:coffeeshop/Models/coffee.dart';
import 'package:coffeeshop/Models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeDetailPage extends StatelessWidget {
  final Coffee coffee;

  const CoffeeDetailPage({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    
    // Ukuran responsif
    final double padding = screenWidth * 0.04; // 4% dari lebar layar
    final double imageHeight = screenHeight * 0.3; // 30% dari tinggi layar
    final double titleFontSize = screenWidth * 0.06 > 24 ? 24 : screenWidth * 0.06; // Maksimal 24
    final double priceFontSize = screenWidth * 0.05 > 20 ? 20 : screenWidth * 0.05; // Maksimal 20
    final double descFontSize = screenWidth * 0.04 > 16 ? 16 : screenWidth * 0.04; // Maksimal 16
    final double buttonFontSize = screenWidth * 0.04 > 16 ? 16 : screenWidth * 0.04; // Maksimal 16
    final double spaceBetween = screenHeight * 0.02; // 2% dari tinggi layar
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Produk',
          style: TextStyle(fontSize: titleFontSize * 0.8),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Consumer<CoffeeShop>(builder: (context, coffeeShop, child) {
        return Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product image
              SizedBox(
                height: imageHeight,
                child: Image.asset(
                  coffee.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: spaceBetween),

              // Product name
              Text(
                coffee.name,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: spaceBetween * 0.5),

              // Product price
              Text(
                'Rp ${coffee.price}',
                style: TextStyle(
                  fontSize: priceFontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.brown,
                ),
              ),
              SizedBox(height: spaceBetween),

              // Product description
              Text(
                'Deskripsi produk tidak tersedia.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: descFontSize,
                ),
              ),
              Text(
                'loreem,',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: descFontSize,
                ),
              ),

              const Spacer(),

              // Add to cart button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add to cart functionality
                    coffeeShop.addCoffeeToCart(coffee);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('${coffee.name} ditambahkan ke keranjang'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: EdgeInsets.symmetric(vertical: padding),
                  ),
                  child: Text(
                    'Tambahkan ke Keranjang',
                    style: TextStyle(fontSize: buttonFontSize),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
