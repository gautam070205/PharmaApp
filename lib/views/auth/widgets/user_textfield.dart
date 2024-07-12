import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/constants/constants.dart';

class UsernameTextfield extends StatelessWidget {
  const UsernameTextfield(
      {super.key,
      this.onEditingComplete,
      this.keyboardType,
      this.initialValue,
      this.controller,
      this.prefixIcon,
      this.hintText});

  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDark,
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType ?? TextInputType.text,
      initialValue: initialValue,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter a valid username";
        } else {
          return null;
        }
      },
      style: appStyle(12, kDark, FontWeight.normal),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        isDense: true,
        contentPadding: EdgeInsets.all(6.h),
        hintStyle: appStyle(12, kGray, FontWeight.normal),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kRed, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimary, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kRed, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kGray, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimary, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimary, width: .5),
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
      ),
    );
  }
}
