import 'package:amazon/common_widgets/auth_button.dart';
import 'package:amazon/common_widgets/bottom_authscreen.dart';
import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.mobileNumber});
  final String mobileNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: const AssetImage('assets/images/amazon_logo.png'),
          height: height * 0.04,
        ),
      ),
      body: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Authentication Required",
              style: textTheme.displayMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.mobileNumber,
                    style: textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: " Change", style: textTheme.bodyMedium!),
                ],
              ),
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            Text(
              "We have sent a One Time Password(OTP) to the mobile number above. Please enter it to complete verification",
              style: textTheme.bodyMedium,
            ),
            CommonFunctions.blankSpace(height * 0.02, 0),
            TextField(
              controller: otpcontroller,
              decoration: InputDecoration(
                hintText: "Enter OTP",
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
            AuthButton(title: "Continue", onPressed: () {}),
            CommonFunctions.blankSpace(height * 0.02, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend OTP",
                    style: textTheme.bodyMedium!.copyWith(color: blue),
                  ),
                ),
              ],
            ),
            CommonFunctions.blankSpace(height * 0.02, 0),
            const BottomAuthScreenWidget()
          ],
        ),
      ),
    );
  }
}
