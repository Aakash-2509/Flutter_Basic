import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool? isEligible;
  String? eligibilityMessage = '';

  void checkEligibilty(int age) {
    if (age >= 18) {
      isEligible = true;
      eligibilityMessage = 'You are eligible to drive!';
      notifyListeners();
    } else {
      isEligible = false;
      eligibilityMessage = 'You are not eligible to drive';
      notifyListeners();
    }
  }
}
