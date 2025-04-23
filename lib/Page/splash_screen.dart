import 'dart:async';
import 'package:flutter/material.dart';
import 'package:coffeeshop/Page/Home_Page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    
    // Menentukan ukuran berdasarkan ukuran layar
    final logoSize = screenWidth * 0.35 > 150 ? 150.0 : screenWidth * 0.35;
    final logoIconSize = logoSize * 0.73;
    final titleFontSize = screenWidth * 0.1 > 40 ? 40.0 : screenWidth * 0.1;
    final subtitleFontSize = screenWidth * 0.04 > 16 ? 16.0 : screenWidth * 0.04;
    
    return Scaffold(
      backgroundColor: const Color(0xFF3D2314),
      body: Stack(
        children: [
          // Background gambar
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          
          // Konten utama
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo dalam lingkaran
                  Container(
                    width: logoSize,
                    height: logoSize,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/coffee_logo.png',
                        width: logoIconSize,
                        height: logoIconSize,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  
                  // Teks LuxeBean
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Luxe',
                          style: TextStyle(
                            color: const Color(0xFFD2A88B),
                            fontFamily: 'Poppins',
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'Bean',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  
                  // Tagline
                  Text(
                    'Kopi spesial untuk',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: subtitleFontSize,
                    ),
                  ),
                  Text(
                    'pengalaman yang istimewa.',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: subtitleFontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 