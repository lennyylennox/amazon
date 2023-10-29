// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/provider/address_provider.dart';
import 'package:amazon/controller/services/user_data_crud_services.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/views/user/address/address_screen.dart';
import 'package:amazon/views/user/home/app_bar.dart';
import 'package:amazon/views/user/home/banner.dart';
import 'package:amazon/views/user/home/categories_list.dart';
import 'package:amazon/views/user/home/address_bar.dart';
import 'package:amazon/views/user/home/todays_deal.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController todaysDealsCarouselController = CarouselController();
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

  clothingDeals(int index) {
    switch (index) {
      case 0:
        return "Kurtas, sarees & more";
      case 1:
        return "Tops, dresses & more";
      case 2:
        return "T-shirt, jeans & more";
      case 3:
        return "View all";
    }
  }

  checkUserAddress() async {
    bool userAddressPresent = await UserDataCRUD.checkUserAddress();
    log("User Address Present : ${userAddressPresent.toString()}");
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    if (userAddressPresent == false) {
      showModalBottomSheet(
          backgroundColor: white,
          context: context,
          builder: (context) {
            return Container(
              height: height * 0.3,
              width: width,
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.03,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Address",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.18,
                    child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      child: const AddressScreen(),
                                      type: PageTransitionType.rightToLeft),
                                );
                              }
                            },
                            child: Container(
                              width: width * 0.4,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03,
                                  vertical: height * 0.01),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: greyShade3,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Builder(builder: (context) {
                                if (index == 0) {
                                  return Text(
                                    "Add Address",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: greyShade3,
                                        ),
                                  );
                                }
                                return Text(
                                  "Add Address",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: greyShade3,
                                      ),
                                );
                              }),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkUserAddress();
      context.read<AddressProvider>().getCurrentSelectedAddress();
    });
  }

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const HomePageUserAddressBar(),
              CommonFunctions.divider(),
              const HomeScreenCategoriesList(),
              CommonFunctions.blankSpace(height * 0.01, 0),
              CommonFunctions.divider(),
              HomeScreenBanner(height: height, width: width),
              //CommonFunctions.blankSpace(height * 0.012, 0),
              CommonFunctions.divider(),
              HomePageTodaysDeal(), CommonFunctions.divider(),
              otherOffersGrid(
                title: "Latest Launches in Headphones",
                textBtnName: "Explore More",
                productPicNamesList: headphonesDeals,
                offerFor: "headphones",
              ),
              CommonFunctions.divider(),
              /*Container(
                height: height * 0.35,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/offersNsponsored/insurance.png",
                      ),
                      fit: BoxFit.cover),
                ),
              ),*/
              CommonFunctions.divider(),
              SizedBox(
                height: height * 0.35,
                width: width,
                child: const Image(
                  image: AssetImage(
                    'assets/images/offersNsponsored/insurance.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              CommonFunctions.divider(),
              otherOffersGrid(
                title: "Minimum 70% off | Top Offers On Clothing",
                textBtnName: "See All Deals",
                productPicNamesList: clothingDealsList,
                offerFor: "clothing",
              ),
              CommonFunctions.divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonFunctions.blankSpace(height * 0.01, 0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Text(
                      "Watch Sixer only on miniTV",
                      style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    //height: height * 0.35,
                    width: width,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                      vertical: height * 0.01,
                    ),
                    child: const Image(
                      image: AssetImage(
                        "assets/images/offersNsponsored/sixer.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container otherOffersGrid({
    required String title,
    required String textBtnName,
    required List<String> productPicNamesList,
    required String offerFor,
  }) {
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
            title,
            style: textTheme.bodyMedium!.copyWith(
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
                                "assets/images/offersNsponsored/${productPicNamesList[index]}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      offerFor == "headphones"
                          ? headphoneDeals(index)
                          : clothingDeals(index),
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
              textBtnName,
              style: textTheme.bodySmall!.copyWith(color: blue),
            ),
          ),
        ],
      ),
    );
  }
}
