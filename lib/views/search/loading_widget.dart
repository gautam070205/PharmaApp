import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:medapp/constants/constants.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        // ignore: prefer_const_constructors
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: LottieBuilder.asset(
            "assets/anime/delivery.json",
            width: width,
            height: height / 2,
          ),
        ));
  }
}
