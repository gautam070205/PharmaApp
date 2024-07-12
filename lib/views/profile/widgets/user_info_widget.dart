import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/models/login_response.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key, this.user})
      : super(key: key); // Fixed key syntax and added null safety for key
  final LoginResponse? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: kGrayLight,
            child: Icon(
              Ionicons.person_outline,
              size: 20.sp,
              color: kGray,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: user?.username ?? "Username",
                  style: appStyle(16, kDark, FontWeight.w600),
                ),
                SizedBox(height: 4.h),
                ReusableText(
                  text: user?.email ?? "example@example.com",
                  style: appStyle(14, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle edit functionality
              print("Edit button tapped!");
            },
            child: Icon(
              Ionicons.create_outline,
              color: kPrimary,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
