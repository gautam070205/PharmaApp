import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/custom_button.dart';
import 'package:medapp/common/custom_container.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/constants/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:medapp/controllers/verification_controller.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        title: ReusableText(
          text: "Please Verify Your Account",
          style: appStyle(12, kGray, FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: CustomContainer(
          color: Colors.white,
          containerContent: SizedBox(
            height: height,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              children: [
                Lottie.asset("assets/anime/delivery.json"),
                SizedBox(
                  height: 30.h,
                ),
                ReusableText(
                  text: " Verify The account",
                  style: appStyle(20, kPrimary, FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Enter the 6-digit Code send to your email,if you didn't see the code ,Please check your spam folder.",
                  textAlign: TextAlign.justify,
                  style: appStyle(10, kPrimary, FontWeight.normal),
                ),
                SizedBox(
                  height: 20.h,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: kPrimary,
                  borderWidth: 2.0,
                  textStyle: appStyle(17, kDark, FontWeight.w600),
                  onCodeChanged: (String code) {},
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onSubmit: (String verificationCode) {
                    controller.setCode = verificationCode;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                    text: "V E R I F Y  A C C O U N T",
                    onTap: () {
                      controller.verificationfunction();
                    },
                    btnHeight: 35.h,
                    btnWidth: width),
              ],
            ),
          )),
    );
  }
}
