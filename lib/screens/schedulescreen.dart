import 'package:flutter/material.dart';
import 'package:schedule_management/utils/colors.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

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
              // Background gradient
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xAAF4C17F),
                        Color(0xFFFAF9F9),
                      ],
                    ),
                  ),
                ),
              ),
              // Illustration
              Positioned(
                left: 44,
                top: 68,
                child: Center(
                  child: Image.asset(
                    'images/Done.png',
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              // Title
              Positioned(
                left: 74,
                top: 290,
                child: SizedBox(
                  width: 227,
                  child: const Text(
                    'Get things done with TODO',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              // Subtitle
              Positioned(
                left: 77,
                top: 350,
                child: Text(
                  'Let’s help you meet up your tasks',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.74),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Input fields
              _buildInputField(context, 390, 'Enter your full name'),
              _buildInputField(context, 462, 'Enter your email'),
              _buildInputField(context, 534, 'Enter password'),
              _buildInputField(context, 606, 'Confirm Password'),
              // Register Button
              Positioned(
                left: 30,
                top: 700,
                child: Container(
                  width: 315,
                  height: 56,
                  decoration: ShapeDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFD8605B), Color(0xFFF4C27F)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.96,
                      ),
                    ),
                  ),
                ),
              ),
              // Already have an account? Sign In
              Positioned(
                left: 54,
                top: 777,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Color(0xFFD8605B),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Add the ElevatedButton at the bottom
              //  / Add an ElevatedButton to navigate to LoginScreen
              // Add an ElevatedButton for navigation to Login Screen
              Positioned(
                left:
                    (screenWidth - 315) / 2, // Centers the button horizontally
                bottom: 30, // Distance from the bottom of the screen
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(315, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to the LoginScreen
                    Navigator.pushNamed(context, '/Login screen');
                  },
                  child: const Text(
                    'Go to loginscreen',
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

  // Helper function to build input fields
  Widget _buildInputField(BuildContext context, double top, String hintText) {
    return Positioned(
      left: 30,
      top: top,
      child: Container(
        width: 325,
        height: 51,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 6,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              hintText,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
