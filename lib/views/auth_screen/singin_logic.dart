// ignore_for_file: use_build_context_synchronously, unused_import

import 'dart:developer';

import 'package:amazon/controller/services/auth_services.dart';
import 'package:amazon/controller/services/user_data_crud_services.dart';
import 'package:amazon/views/auth_screen/auth_screen.dart';
import 'package:amazon/views/user/home/home_screen.dart';
import 'package:amazon/views/user/user_data/user_data_input_screen.dart';
import 'package:amazon/views/user/user_persistant_nav_bar/user_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {
  checkUser() async {
    bool userExists = await UserDataCRUD.checkUser();
    log(userExists.toString());
    if (userExists == true) {
      Navigator.push(
        context,
        PageTransition(
          child: const UserBottomNavBar(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    } else {
      Navigator.push(
        context,
        PageTransition(
          child: const UserDataInputScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    }
  }

  checkAuthentication() {
    bool userIsAuthenticated = AuthServices.checkAuthentication();
    userIsAuthenticated
        ? checkUser()
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
                child: const AuthScreen(),
                type: PageTransitionType.leftToRight),
            (route) => false);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkAuthentication();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/images/amazon_splash_screen.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
