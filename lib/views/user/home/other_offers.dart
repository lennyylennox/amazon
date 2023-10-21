import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePageOtherOffers extends StatelessWidget {
  const HomePageOtherOffers({super.key});
  headphoneDeals(int index) {
    switch (index) {
      case 0:
        return "Bose";
      case 1:
        return "boAt";
      case 2:
        return "Sony";
      case 3:
        return "OnePlus";
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.01,
      ),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Latest Launches in Headphones",
            style: textTheme.displaySmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          CommonFunctions.blankSpace(height * 0.012, 0),
          GridView.builder(
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: greyShade3),
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/images/offersNsponsored/${headphonesDeals[index]}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      headphoneDeals(index),
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            },
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Explore More",
              style: textTheme.bodySmall!.copyWith(color: blue),
            ),
          ),
        ],
      ),
    );
  }
}
