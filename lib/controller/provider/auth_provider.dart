import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String phoneNumber = '';
  String verificationId = '';
  String otp = '';

  updatePhoneNo({required String num}) {
    phoneNumber = num;
    notifyListeners();
  }

  updateVerificationID({required String verID}) {
    verificationId = verID;
    notifyListeners();
  }
}
