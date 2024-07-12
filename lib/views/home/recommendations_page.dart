import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/back_ground_container.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/common/shimmers/medicinelist_shimmer.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/hooks/fetch_all_medicine.dart';
import 'package:medapp/models/medicines.dart';
import 'package:medapp/views/home/widgets/medicine_tile.dart';

class RecommendationPage extends HookWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllMedicines("41007428");
    List<MedicineModel>? medicines = hookResults.data;
    final isLoading = hookResults.isLoading;
    // ignore: unused_local_variable
    final error = hookResults.error;
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: kSecondary,
            title: ReusableText(
              text: "Recommendations",
              style: appStyle(13, kGray, FontWeight.w600),
            )),
        body: BackGroundContainer(
          // ignore: sort_child_properties_last
          child: isLoading
              ? MedicinelistShimmer()
              : Padding(
                  padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(medicines!.length, (i) {
                      MedicineModel medicine = medicines[i];
                      return MedicineTile(
                        medicine: medicine,
                      );
                    }),
                  ),
                ),
          color: Colors.white,
        ));
  }
}
