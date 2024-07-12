import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/controllers/phoneVerification_controller.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneverificationController());
    return PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: kPrimary,
      backgroundColor: kLightWhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: appStyle(20, kPrimary, FontWeight.bold),
      textColor: kPrimary,
      onSend: (String value) {
        controller.setPhone = value;
      },
      onVerification: (String value) {},
    );
  }
}
