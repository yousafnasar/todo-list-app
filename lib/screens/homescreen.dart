import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:schedule_management/utils/navigation_provider.dart';
import 'package:schedule_management/widgets/buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xABF4C27F),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset('assets/images/Done.png'),
              Text(
                'WELCOME',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                'OUR REMINDER',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum dictum tempus, interdum at dignissim metus. Ultricies sed nunc.',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: PrimaeyFloatingButton(
          label: 'Get Started',
          screenWidth: screenWidth,
          icon: SvgPicture.asset(
            'assets/icons/Vector.svg',
            width: 22,
            height: 12,
          ),
          onPressed: () {
            Provider.of<NavigationProvider>(context, listen: false)
                .navigateTo(context, '/registrationscreen');
          },
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat),
    );
  }
}
