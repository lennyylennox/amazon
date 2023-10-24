import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfilePageAppBar extends StatelessWidget {
  const ProfilePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.012,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: appBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Image(
            image: const AssetImage("assets/images/amazon_black_logo.png"),
            height: height * 0.04,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: black,
              size: height * 0.035,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: black,
              size: height * 0.035,
            ),
          ),
        ],
      ),
    );
  }
}
