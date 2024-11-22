import 'package:flutter/material.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          decoration: const BoxDecoration(
            color: Color(0xFFFAF9F9),
          ),
          child: Stack(
            children: [
              // Background
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: const BoxDecoration(
                    color: Color(0xAAF4C17F),
                  ),
                ),
              ),

              // Header Image
              Positioned(
                left: (screenWidth - 287) / 2,
                top: 68,
                child: Container(
                  width: 287,
                  height: 215,
                  child: Center(
                    child: Image.asset(
                      'images/Done.png',
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.3,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Welcome Text
              Positioned(
                left: (screenWidth - 250) / 2,
                top: 294,
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Welcome back \nto\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: 'OUR REMINDER',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Email Field
              Positioned(
                left: 30,
                top: 425,
                child: _buildTextField('Enter your email'),
              ),

              // Password Field
              Positioned(
                left: 30,
                top: 500,
                child: _buildTextField('Enter password'),
              ),

              // Forgot Password
              Positioned(
                left: (screenWidth - 150) / 2,
                top: 616,
                child: const Text(
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),

              // Sign In Button
              Positioned(
                left: (screenWidth - 315) / 2,
                top: 700,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(315, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: const Color(0xFFD8605B),
                    shadowColor: Colors.black26,
                    elevation: 6,
                  ),
                  onPressed: () {
                    // Navigate to HomeScreen
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              // Sign Up Option
              Positioned(
                left: (screenWidth - 300) / 2,
                top: 777,
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Don’t have an account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: const Color(0xFFD8605B),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Text Field Widget
  Widget _buildTextField(String hintText) {
    return Container(
      width: 325,
      height: 51,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.only(left: 30),
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
    );
  }
}
