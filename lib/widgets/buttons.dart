import 'package:flutter/material.dart';

class PrimaeyFloatingButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final double screenWidth;
  final VoidCallback onPressed; // Added callback for the button's action

  const PrimaeyFloatingButton({
    super.key,
    required this.label,
    this.icon,
    required this.screenWidth,
    required this.onPressed,
    required FloatingActionButtonLocation
        floatingActionButtonLocation, // Receive the callback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Trigger the callback when the button is tapped
      child: Container(
        width: screenWidth - 50,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xffD8605B), Color(0xffF4C27F)],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(100, 0, 0, 0),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 10),
            icon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
