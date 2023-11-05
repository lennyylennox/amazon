import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/controller/provider/address_provider.dart';
import 'package:amazon/model/address_model.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageUserAddressBar extends StatelessWidget {
  const HomePageUserAddressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.012,
      ),
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: addressBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
          if (addressProvider.fetchedCurrentAddress == false) {
            AddressModel selectedAddress =
                addressProvider.currentSelectedAddress;
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_pin,
                  color: black,
                ),
                CommonFunctions.blankSpace(0, width * 0.02),
                Text(
                  "Deliver to ${selectedAddress.name} - ${selectedAddress.town}, ${selectedAddress.state}",
                  style: textTheme.bodySmall,
                ),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_pin,
                  color: black,
                ),
                CommonFunctions.blankSpace(0, width * 0.02),
                Text(
                  "Deliver to user - City, State",
                  style: textTheme.bodySmall,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
