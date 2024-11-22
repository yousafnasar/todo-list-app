import 'package:flutter/material.dart';
import 'package:schedule_management/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(color: Color(0xFFFAF9F9)),
          child: Stack(
            children: [
              // Background Container
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.5,
                  decoration: const BoxDecoration(color: Color(0xAAF4C17F)),
                ),
              ),

              // Image Section
              Positioned(
                left: 0,
                top: screenHeight * 0.2,
                child: Center(
                  child: Image.asset(
                    'images/Done.png',
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Welcome Text
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.55,
                child: Column(
                  children: [
                    Text(
                      'Welcome to\nOUR REMINDER',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum dictum tempus, interdum at dignissim metus. Ultricies sed nunc.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Button
              Positioned(
                left: screenWidth * 0.1,
                top: screenHeight * 0.8,
                child: SizedBox(
                  width: screenWidth * 0.8,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: AppColors.secondaryColor,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              // Add the ElevatedButton at the bottom
              Positioned(
                left: (screenWidth - 315) / 2, // 315 is the button width
                bottom: 30, // Distance from the bottom
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(315, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/schedule');
                  },
                  child: const Text(
                    'Go to Schedule Screen',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
