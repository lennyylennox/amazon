import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.title,
    required this.onPressed,
    super.key,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height * 0.06),
        backgroundColor: amber,
      ),
      child: Text(
        title,
        style: textTheme.displaySmall!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
