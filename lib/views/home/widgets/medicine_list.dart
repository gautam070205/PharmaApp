import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medapp/common/shimmers/nearby_shimmer.dart';

import 'package:medapp/hooks/fetch_medicine.dart';
import 'package:medapp/models/medicines.dart';
import 'package:medapp/views/Medicines/medicine_page.dart';
import 'package:medapp/views/home/widgets/medicine_widget.dart';

class MedicineList extends HookWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchMedicines("41007428");
    List<MedicineModel>? medicines = hookResults.data;
    final isLoading = hookResults.isLoading;
    // ignore: unused_local_variable
    final error = hookResults.error;
    return Container(
      height: 180.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(medicines!.length, (i) {
                MedicineModel medicine = medicines[i];
                return MedicineWidget(
                    onTap: () {
                      Get.to(() => MedicinePage(medicine: medicine));
                    },
                    image: medicine.imageUrl[0],
                    title: medicine.title,
                    time: medicine.time,
                    price: medicine.price.toStringAsFixed(2));
              }),
            ),
    );
  }
}
