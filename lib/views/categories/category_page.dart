import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/back_ground_container.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/common/shimmers/medicinelist_shimmer.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/controllers/category_controller.dart';
import 'package:medapp/hooks/fetch_category_medicines.dart';
import 'package:medapp/models/medicines.dart';
import 'package:medapp/views/home/widgets/medicine_tile.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResults = useFetchMedicinesByCategory("41007428");
    List<MedicineModel>? medicines = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kOffWhite,
          leading: IconButton(
              onPressed: () {
                controller.updateCategory = '';
                controller.updateTitle = '';
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kDark,
              )),
          title: ReusableText(
            text: "${controller.TitleValue} Category",
            style: appStyle(13, kGray, FontWeight.w600),
          ),
        ),
        body: BackGroundContainer(
            color: Colors.white,
            child: SizedBox(
              child: Container(
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
              ),
            )));
  }
}
