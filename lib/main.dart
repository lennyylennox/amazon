import 'package:amazon/utils/theme.dart';
import 'package:amazon/views/auth_screen.dart';
import 'package:amazon/views/otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OTPScreen(mobileNumber: "+233 54 919 5168"),
      debugShowCheckedModeBanner: false,
      theme: theme,
    );
  }
}
