import 'package:amazon/constants/constants.dart';
import 'package:amazon/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: CarouselController(),
      options: CarouselOptions(
        height: height * 0.23,
        autoPlay: true,
      ),
      items: carouselPictures.map((i) {
        return Builder(builder: (BuildContext context) {
          return Container(
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: amber,
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/carousel_slideshow/$i",
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        });
      }).toList(),
    );
  }
}
