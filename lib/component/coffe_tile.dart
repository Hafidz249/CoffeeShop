import 'package:coffeeshop/Models/coffee.dart';
import 'package:coffeeshop/Page/coffe_detail_page.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final void Function()? onPressed;
  final Widget icon;
  final Color? backgroundColor; // Added parameter for background color

  const CoffeeTile({
    Key? key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = const Color(0xFFEEEEEE), // Default to grey[200]
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Mengatur ukuran berdasarkan ukuran layar
    final double verticalPadding = screenWidth * 0.05; // 5% dari lebar layar
    final double horizontalPadding = screenWidth * 0.025; // 2.5% dari lebar layar
    final double imageSize = screenWidth * 0.15 > 60 ? 60 : screenWidth * 0.15; // Maksimal 60
    final double fontSize = screenWidth * 0.035 > 14 ? 14 : screenWidth * 0.035; // Maksimal 14
    final double buttonFontSize = screenWidth * 0.03 > 12 ? 12 : screenWidth * 0.03; // Maksimal 12
    
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor, // Use the parameter here instead of fixed color
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: screenWidth * 0.025), // 2.5% dari lebar layar
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
      child: Row(
        children: [
          // Gambar
          SizedBox(
            width: imageSize,
            height: imageSize,
            child: Image.asset(coffee.imagePath, fit: BoxFit.contain),
          ),
          SizedBox(width: screenWidth * 0.03), // 3% dari lebar layar
          
          // Informasi kopi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee.name,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp ${coffee.price}',
                  style: TextStyle(fontSize: fontSize * 0.9),
                ),
              ],
            ),
          ),
          
          // Tombol
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Detail button
              ElevatedButton(
                onPressed: () {
                  // Navigate to detail page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoffeeDetailPage(coffee: coffee),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA1887F),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenWidth * 0.01,
                  ),
                ),
                child: Text(
                  'Detail',
                  style: TextStyle(fontSize: buttonFontSize),
                ),
              ),
              SizedBox(width: screenWidth * 0.02), // 2% dari lebar layar
              
              // Add to cart button
              IconButton(
                icon: icon,
                iconSize: screenWidth * 0.06 > 24 ? 24 : screenWidth * 0.06, // Maksimal 24
                onPressed: onPressed,
                padding: EdgeInsets.all(screenWidth * 0.01), // 1% dari lebar layar
              ),
            ],
          ),
        ],
      ),
    );
  }
}
