import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/constants/constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      height: 110.h,
      width: width,
      color: kOffWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 22.r,
            backgroundColor: kSecondary,
            backgroundImage: const NetworkImage(
                "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg"),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableText(
                    text: "Deliver to",
                    style: appStyle(13, kSecondary, FontWeight.w600),
                  ),
                  SizedBox(
                    width: width * 0.65,
                    child: Text(
                      "San Francisco,California",
                      overflow: TextOverflow.ellipsis,
                      style: appStyle(11, kGrayLight, FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            getTimeOfDay(),
            style: const TextStyle(fontSize: 35),
          ),
        ],
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      return '☀️'; // Morning
    } else if (hour >= 12 && hour < 16) {
      return '⛅'; // Afternoon
    } else {
      return '🌙'; // Evening/Night
    }
  }
}
