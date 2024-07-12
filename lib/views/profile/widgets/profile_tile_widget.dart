import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/constants/constants.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget(
      {super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final IconData icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      minLeadingWidth: 0,
      onTap: onTap,
      leading: Icon(
        icon,
        size: 18,
      ),
      title: ReusableText(
        text: title,
        style: appStyle(11, kGray, FontWeight.normal),
      ),
      trailing: title != "Settings"
          ? const Icon(AntDesign.right)
          : SvgPicture.asset(
              'assets/icons/indi.svg',
              width: 15,
              height: 20.h,
            ),
    );
  }
}
