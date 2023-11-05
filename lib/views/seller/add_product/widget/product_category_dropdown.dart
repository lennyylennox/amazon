import 'package:amazon/constants/common_functions.dart';
import 'package:flutter/material.dart';

class AddProductCommonTextField extends StatelessWidget {
  const AddProductCommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.textController,
  });

  final TextEditingController textController;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium,
        ),
        CommonFunctions.blankSpace(
          height * 0.01,
          0,
        ),
      ],
    );
  }
}