// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageTodaysDeal extends StatelessWidget {
  HomePageTodaysDeal({
    super.key,
  });

  CarouselController todaysDealsCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "50% - 80% off | Latest deals.",
              style: textTheme.displaySmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            CarouselSlider(
              carouselController: CarouselController(),
              options: CarouselOptions(
                height: height * 0.23,
                autoPlay: true,
              ),
              items: todaysDeals.map((i) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    //padding: EdgeInsets.all(50),
                    width: width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/todays_deals/$i",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                });
              }).toList(),
            ),
            CommonFunctions.blankSpace(height * 0.04, 0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: red,
                  ),
                  child: Text(
                    "Up to 62% Off",
                    style: textTheme.labelMedium!.copyWith(color: white),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * 0.03),
                Text(
                  "Deal of the Day",
                  style: textTheme.labelMedium!.copyWith(
                    color: red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            GridView.builder(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    log(index.toString());
                    todaysDealsCarouselController.animateToPage(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyShade3),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/todays_deals/${todaysDeals[index]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            TextButton(
              onPressed: () {},
              child: Text(
                "See all Deals",
                style: textTheme.bodySmall!.copyWith(color: blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
