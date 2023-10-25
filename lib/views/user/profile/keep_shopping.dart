import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class KeepShopping extends StatelessWidget {
  const KeepShopping({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Keep Shopping for",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Browsing history",
                  style: textTheme.bodySmall!.copyWith(color: blue),
                ),
              )
            ],
          ),
          CommonFunctions.blankSpace(height * 0.02, 0),
          GridView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: const PageScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: greyShade3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Text(
                    "Product",
                    style: textTheme.bodyMedium,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
