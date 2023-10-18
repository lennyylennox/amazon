import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomAuthScreenWidget extends StatelessWidget {
  const BottomAuthScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          height: 2,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [white, greyShade3, white],
            ),
          ),
        ),
        CommonFunctions.blankSpace(height * 0.02, 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Conditions of Use",
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              "Privacy Notice",
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
            Text(
              "Help",
              style: textTheme.bodyMedium!.copyWith(color: blue),
            ),
          ],
        ),
        CommonFunctions.blankSpace(height * 0.01, 0),
        Text(
          "© 1996-2023, Amazon.com, Inc or its affiliates",
          style: textTheme.labelMedium!.copyWith(
            color: grey,
          ),
        )
      ],
    );
  }
}
