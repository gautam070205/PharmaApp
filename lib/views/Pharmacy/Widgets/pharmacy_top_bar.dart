import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/views/Pharmacy/direction_page.dart';
import 'package:medapp/views/Pharmacy/pharmacy_page.dart';

class PharmacyTopBar extends StatelessWidget {
  const PharmacyTopBar({
    super.key,
    required this.widget,
  });

  final PharmacyPage widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 40.h,
        left: 0,
        right: 0,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Get.back();
                //   },
                //   child: const Icon(
                //     Ionicons.chevron_back_circle,
                //     size: 28,
                //     color: kLightWhite,
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Ionicons.chevron_back_circle,
                    size: 28,
                    color: kLightWhite,
                  ),
                ),
                ReusableText(
                    text: widget.pharmacy!.title,
                    style: appStyle(12, kDark, FontWeight.w600)),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const DirectionPage());
                  },
                  child: const Icon(
                    Ionicons.location,
                    size: 28,
                    color: kLightWhite,
                  ),
                )
              ],
            )));
  }
}
