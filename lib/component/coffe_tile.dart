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
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor, // Use the parameter here instead of fixed color
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(coffee.name),
        subtitle: Text('Rp ' + coffee.price),
        leading: Image.asset(coffee.imagePath),
        trailing: Row(
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              child: const Text('Detail'),
            ),
            const SizedBox(width: 8),
            // Add to cart button
            IconButton(
              icon: icon,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
