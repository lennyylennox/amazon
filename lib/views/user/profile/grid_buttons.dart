import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class GridButtons extends StatelessWidget {
  const GridButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return GridView.builder(
      itemCount: 4,
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3.4,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: grey,
            ),
            borderRadius: BorderRadius.circular(
              50,
            ),
            color: greyShade3,
          ),
          alignment: Alignment.center,
          child: Builder(
            builder: (context) {
              if (index == 0) {
                return Text(
                  "Your Orders",
                  style: textTheme.bodyMedium,
                );
              }
              if (index == 1) {
                return Text(
                  "Your Orders",
                  style: textTheme.bodyMedium,
                );
              }
              if (index == 2) {
                return Text(
                  "Your Account",
                  style: textTheme.bodyMedium,
                );
              }
              return Text(
                "Your Wish Lists",
                style: textTheme.bodyMedium,
              );
            },
          ),
        );
      },
    );
  }
}
