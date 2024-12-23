import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
    notifyListeners();
  }
}
