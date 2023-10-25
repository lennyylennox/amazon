import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/views/user/profile/app_bar.dart';
import 'package:amazon/views/user/profile/buy_again.dart';
import 'package:amazon/views/user/profile/grid_buttons.dart';
import 'package:amazon/views/user/profile/keep_shopping.dart';
import 'package:amazon/views/user/profile/user_greeting.dart';
import 'package:amazon/views/user/profile/user_orders.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, height * 0.08),
          child: const ProfilePageAppBar(),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Column(
              children: [
                const UserGreeting(),
                CommonFunctions.blankSpace(height * 0.01, 0),
                const GridButtons(),
                CommonFunctions.blankSpace(height * 0.02, 0),
                const UserOrders(),
                CommonFunctions.divider(),
                CommonFunctions.blankSpace(height * 0.01, 0),
                const KeepShopping(),
                CommonFunctions.blankSpace(height * 0.01, 0),
                CommonFunctions.divider(),
                const BuyAgain(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
