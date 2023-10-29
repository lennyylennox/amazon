// ignore_for_file: unused_local_variable

import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/services/user_data_crud_services.dart';
import 'package:amazon/model/address_model.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController housenameController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, height * 0.08),
          child: Container(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image:
                      const AssetImage("assets/images/amazon_black_logo.png"),
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
          ),
        ),
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AddressScreenTextField(
                  textController: nameController,
                  title: "Full Name",
                  hintText: "Enter your name",
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(
                  textController: mobileController,
                  title: "Mobile Number",
                  hintText: "Enter your mobile number",
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(
                  textController: housenameController,
                  hintText: "Enter your house no",
                  title: "House Number",
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(
                  textController: landmarkController,
                  hintText: "Enter the closest Landmark",
                  title: "Landmark",
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(
                  textController: pincodeController,
                  hintText: "Enter your pin code",
                  title: "Pin Code",
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(
                  textController: townController,
                  hintText: "Enter your town",
                  title: "Town",
                ),
                /*CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(
                  textController: nameController,
                  title: "Enter your name",
                  hintText: "Enter your name",
                ),*/
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(
                  textController: stateController,
                  title: "State / Region",
                  hintText: "Enter your state/region",
                ),
                CommonFunctions.blankSpace(height * 0.04, 0),
                ElevatedButton(
                  onPressed: () {
                    Uuid uuid = const Uuid();
                    String docID = uuid.v1();
                    AddressModel addressModel = AddressModel(
                      name: nameController.text.trim(),
                      mobileNumber: mobileController.text.trim(),
                      authenticatedMobileNumber: auth.currentUser!.phoneNumber,
                      houseNumber: housenameController.text.trim(),
                      area: areaController.text.trim(),
                      landMark: landmarkController.text.trim(),
                      pincode: pincodeController.text.trim(),
                      town: townController.text.trim(),
                      state: stateController.text.trim(),
                      docID: docID,
                      isDefault: true,
                    );
                    UserDataCRUD.addUserAddress(
                      context: context,
                      addressModel: addressModel,
                      docID: docID,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: amber,
                      minimumSize: Size(width, height * 0.06)),
                  child: Text(
                    "Add Address",
                    style: textTheme.bodyMedium,
                  ),
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddressScreenTextField extends StatelessWidget {
  const AddressScreenTextField({
    super.key,
    required this.textController,
    required this.title,
    required this.hintText,
  });

  final TextEditingController textController;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium,
        ),
        CommonFunctions.blankSpace(height * 0.01, 0),
        TextField(
          controller: textController,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: width * 0.03),
            hintText: hintText,
            hintStyle: textTheme.bodySmall,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: secondaryColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: grey),
            ),
          ),
        ),
      ],
    );
  }
}
