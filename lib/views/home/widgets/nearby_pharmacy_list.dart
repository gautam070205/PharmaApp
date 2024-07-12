import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medapp/common/shimmers/nearby_shimmer.dart';

import 'package:medapp/hooks/fetch_pharmacy.dart';
import 'package:medapp/models/pharmacy.dart';
import 'package:medapp/views/Pharmacy/pharmacy_page.dart';
import 'package:medapp/views/home/widgets/pharmacy_widget.dart';

class NearbyPharmacyList extends HookWidget {
  const NearbyPharmacyList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchPharmacy("41007428");
    List<PharmacyModel>? pharmacys = hookResults.data;
    final isLoading = hookResults.isLoading;
    // ignore: unused_local_variable
    final error = hookResults.error;
    return isLoading
        ? const NearbyShimmer()
        : Container(
            height: 190.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(pharmacys!.length, (i) {
                PharmacyModel pharmacy = pharmacys[i];
                return PharmacyWidget(
                    onTap: () {
                      Get.to(() => PharmacyPage(pharmacy: pharmacy));
                    },
                    image: pharmacy.imageUrl,
                    logo: pharmacy.logoUrl,
                    title: pharmacy.title,
                    time: pharmacy.time,
                    rating: pharmacy.ratingCount);
              }),
            ),
          );
  }
}
