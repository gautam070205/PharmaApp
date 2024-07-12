import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:medapp/common/custom_button.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/views/Pharmacy/pharmacy_page.dart';
import 'package:medapp/views/Pharmacy/rating_page.dart';

class PharmacyBottomBar extends StatelessWidget {
  const PharmacyBottomBar({
    super.key,
    required this.widget,
  });

  final PharmacyPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBarIndicator(
            itemCount: 5,
            itemSize: 25,
            rating: widget.pharmacy!.rating.toDouble(),
            itemBuilder: (context, i) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                )),
        CustomButton(
            onTap: () {
              Get.to(() => RatingPage());
            },
            btnColor: kSecondary,
            btnWidth: width / 3,
            text: "Rate Pharmacy")
      ],
    );
  }
}
