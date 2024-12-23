import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schedule_management/screens/registrationscreen.dart';
import '../controllers/signup_controller.dart';
import '../widgets/customTextField.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  final SignupController controller = SignupController.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xAAF4C17F),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Done.png',
                  height: 200,
                ),
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                buildInputField(
                  controller: controller.fullNameController,
                  hintText: "Full Name",
                ),
                const SizedBox(height: 20),
                buildInputField(
                  controller: controller.emailController,
                  hintText: "Email",
                ),
                const SizedBox(height: 20),
                buildInputField(
                  controller: controller.passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                buildInputField(
                  controller: controller.confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    controller.registerUser();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(double.infinity, 56),
                    backgroundColor: const Color(0xFFD8605B),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text: "Login",
                          style: const TextStyle(color: Color(0xFFD8605B)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
