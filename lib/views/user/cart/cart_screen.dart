import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/views/user/home/app_bar.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, height * 0.08),
          child: const HomePageAppBar(),
        ),
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Subtotal ",
                        style: textTheme.bodyLarge,
                      ),
                      TextSpan(
                        text: "GH₵ 5,482",
                        style: textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                CommonFunctions.blankSpace(height * 0.01, 0),
                SizedBox(
                  height: height * 0.06,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: teal,
                      ),
                      CommonFunctions.blankSpace(0, width * 0.01),
                      Expanded(
                        child: Column(
                          children: [
                            RichText(
                              //textAlign: TextAlign.justify,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "Your Order is eligible for FREE Delivery. ",
                                    style: textTheme.bodySmall!
                                        .copyWith(color: teal),
                                  ),
                                  TextSpan(
                                    text: "Select this option at checkout. ",
                                    style: textTheme.bodySmall,
                                  ),
                                  TextSpan(
                                    text: "Details",
                                    style: textTheme.bodySmall!
                                        .copyWith(color: teal),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: amber,
                    minimumSize: Size(width, height * 0.06),
                  ),
                  child: Text(
                    "Proceed to Buy",
                    style: textTheme.bodyMedium,
                  ),
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                CommonFunctions.divider(),
                CommonFunctions.blankSpace(height * 0.02, 0),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      //height: height * 0.2,
                      width: width,
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02, vertical: height * 0.01),
                      margin: EdgeInsets.symmetric(vertical: height * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade1,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(
                                    "assets/images/todays_deals/todaysDeal1.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                CommonFunctions.blankSpace(height * 0.01, 0),
                                Container(
                                  height: height * 0.06,
                                  width: width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: greyShade3),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(color: grey),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            color: black,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          color: white,
                                          alignment: Alignment.center,
                                          child: const Text("1"),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              left: BorderSide(color: grey),
                                            ),
                                          ),
                                          child: const Icon(Icons.add),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CommonFunctions.blankSpace(0, width * 0.02),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product name",
                                  style: textTheme.bodyLarge,
                                ),
                                CommonFunctions.blankSpace(height * 0.01, 0),
                                Text(
                                  "GH₵ 2,482",
                                  style: textTheme.displayMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                CommonFunctions.blankSpace(height * 0.005, 0),
                                Text(
                                  "Eligible for Free Shipping",
                                  style: textTheme.bodySmall!
                                      .copyWith(color: grey),
                                ),
                                CommonFunctions.blankSpace(height * 0.005, 0),
                                Text(
                                  "In Stock",
                                  style: textTheme.bodySmall!
                                      .copyWith(color: teal),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: white,
                                        side: BorderSide(
                                          color: greyShade3,
                                        ),
                                      ),
                                      child: Text(
                                        "Delete",
                                        style: textTheme.bodySmall,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: white,
                                        side: BorderSide(
                                          color: greyShade3,
                                        ),
                                      ),
                                      child: Text(
                                        "Save for Later",
                                        style: textTheme.bodySmall,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
