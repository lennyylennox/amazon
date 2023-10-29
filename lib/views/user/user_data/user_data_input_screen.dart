import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/services/user_data_crud_services.dart';
import 'package:amazon/model/user_model.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class UserDataInputScreen extends StatefulWidget {
  const UserDataInputScreen({super.key});

  @override
  State<UserDataInputScreen> createState() => _UserDataInputScreenState();
}

class _UserDataInputScreenState extends State<UserDataInputScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      phoneController.text = auth.currentUser!.phoneNumber ?? "";
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
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Help us to know you more",
                style:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),
              Text(
                "Enter your name",
                style: textTheme.bodyMedium,
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter Your Full Name",
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
              CommonFunctions.blankSpace(height * 0.02, 0),
              Text(
                "Phone Number",
                style: textTheme.bodyMedium,
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              TextField(
                controller: phoneController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Enter Your Phone Number",
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
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  UserModel userModel = UserModel(
                      name: nameController.text.trim(),
                      mobileNum: phoneController.text.trim(),
                      userType: 'user');
                  await UserDataCRUD.addNewUser(
                      userModel: userModel, context: context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: amber,
                  minimumSize: Size(width, height * 0.06),
                ),
                child: Text(
                  "Proceed",
                  style: textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
