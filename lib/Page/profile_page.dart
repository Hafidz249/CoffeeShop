import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffeeshop/Models/coffee_shop.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You can replace these with actual user data from your authentication system
    const String userName = "Hafidz";
    const String userEmail = "HafidzGanteng@gmail.com";
    const String memberSince = "Member since: Jan 2025";

    return Scaffold(
      body: Consumer<CoffeeShop>(
        builder: (context, coffeeShop, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Profile header with background
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 78, 52, 46),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Profile picture
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          backgroundImage: AssetImage(
                              'assets/images/Profile.jpg'),
                          // Replace with actual profile image if available
                        ),
                        const SizedBox(height: 10),
                        // User name
                        const Text(
                          userName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // User email
                        Text(
                          userEmail,
                          style: TextStyle(
                            color: Colors.brown[100],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Member since
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          memberSince,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Profile menu items
                  _buildProfileMenuItem(
                    context,
                    title: 'My Orders',
                    icon: Icons.receipt_long,
                    onTap: () {
                      // Navigate to orders page
                    },
                  ),

                  _buildProfileMenuItem(
                    context,
                    title: 'Favorite Drinks',
                    icon: Icons.favorite,
                    onTap: () {
                      // Navigate to favorites page
                    },
                  ),

                  _buildProfileMenuItem(
                    context,
                    title: 'Payment Methods',
                    icon: Icons.payment,
                    onTap: () {
                      // Navigate to payment methods page
                    },
                  ),

                  _buildProfileMenuItem(
                    context,
                    title: 'Delivery Addresses',
                    icon: Icons.location_on,
                    onTap: () {
                      // Navigate to addresses page
                    },
                  ),

                  _buildProfileMenuItem(
                    context,
                    title: 'Notifications',
                    icon: Icons.notifications,
                    onTap: () {
                      // Navigate to notifications page
                    },
                  ),

                  _buildProfileMenuItem(
                    context,
                    title: 'Settings',
                    icon: Icons.settings,
                    onTap: () {
                      // Navigate to settings page
                    },
                  ),

                  const SizedBox(height: 10),

                  // Loyalty card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.brown[400]!, Colors.brown[800]!],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Loyalty Card',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              5,
                              (index) => Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: index < 2
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: index < 2
                                    ? const Icon(Icons.local_cafe,
                                        color: Colors.brown)
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Buy 5 coffees and get 1 free!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Logout button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle logout
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[700],
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.brown[700],
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
