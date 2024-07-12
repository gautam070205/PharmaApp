import 'package:flutter/material.dart';
import 'package:medapp/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  // ignore: use_super_parameters, prefer_const_constructors_in_immutables
  CustomContainer({Key? key, required this.containerContent, this.color})
      : super(key: key);
  Widget containerContent;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        child: Container(
          width: width,
          color: color ?? kOffWhite,
          child: SingleChildScrollView(
            child: containerContent,
          ),
        ),
      ),
    );
  }
}
