import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get package
import 'package:lottie/lottie.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/custom_button.dart';
import 'package:medapp/common/custom_container.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/views/auth/widgets/login_page.dart';

class LoginRedirect extends StatelessWidget {
  LoginRedirect({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimary,
          title: Center(
            child: ReusableText(
              text: "MedicineApp",
              style: appStyle(20, kLightWhite, FontWeight.bold),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomContainer(
            containerContent: Column(
              children: [
                Container(
                  width: width,
                  height: height / 2,
                  color: Colors.white,
                  child: LottieBuilder.asset(
                    "assets/anime/delivery.json",
                    width: width,
                    height: height / 2,
                  ),
                ),
                CustomButton(
                  text: "L O G I N",
                  onTap: () {
                    Get.to(() => const LoginPage(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 900));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
