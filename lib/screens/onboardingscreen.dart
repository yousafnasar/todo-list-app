import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  Future<void> _completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
    // Use Navigator.pushReplacement to go to home screen
    Navigator.pushReplacementNamed(context, '/homescreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                _buildPage(
                  "assets/images/onboarding1.png",
                  "Welcome to Schedule Management",
                  "Manage your daily tasks efficiently.",
                ),
                _buildPage(
                  "assets/images/onboarding2.png",
                  "Track Your Progress",
                  "Stay on top of your goals with detailed progress tracking.",
                ),
                _buildPage(
                  "assets/images/onboarding3.png",
                  "Achieve More",
                  "Stay organized and get more done!",
                ),
              ],
            ),
          ),
          _buildNavigationBar(context),
        ],
      ),
    );
  }

  Widget _buildPage(String imagePath, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 250),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: _currentIndex == 0
                ? null
                : () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
            child: const Text("Back"),
          ),
          Row(
            children: List.generate(
              3,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 12 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      _currentIndex == index ? Colors.blueAccent : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: _currentIndex == 2
                ? () => _completeOnboarding(context)
                : () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
            child: Text(_currentIndex == 2 ? "Done" : "Next"),
          ),
        ],
      ),
    );
  }
}
