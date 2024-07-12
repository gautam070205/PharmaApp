import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medapp/common/shimmers/medicinelist_shimmer.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/hooks/fetch_category_medicines.dart';
import 'package:medapp/models/medicines.dart';
import 'package:medapp/views/home/widgets/medicine_tile.dart';

class CategoryMedicinesList extends HookWidget {
  const CategoryMedicinesList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchMedicinesByCategory("41007428");
    List<MedicineModel>? medicines = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Container(
      width: width,
      height: height,
      child: isLoading
          ? const MedicinelistShimmer()
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
    );
  }
}
