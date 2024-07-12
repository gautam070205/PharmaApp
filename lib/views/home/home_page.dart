import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medapp/common/custom_appbar.dart';
import 'package:medapp/common/custom_container.dart';
import 'package:medapp/common/heading.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/controllers/category_controller.dart';
import 'package:medapp/views/home/all_fastest_medicine.dart';
import 'package:medapp/views/home/all_nearby_pharmacys.dart';
import 'package:medapp/views/home/recommendations_page.dart';
import 'package:medapp/views/home/widgets/category_list.dart';
import 'package:medapp/views/home/widgets/category_medicine_list.dart';
import 'package:medapp/views/home/widgets/medicine_list.dart';
import 'package:medapp/views/home/widgets/nearby_pharmacy_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h), child: const CustomAppbar()),
      body: SafeArea(
          child: CustomContainer(
              containerContent: Column(
        children: [
          CategoryList(),
          Obx(() => controller.categoryValue == ''
              ? Column(
                  children: [
                    Heading(
                      text: "Try Something New",
                      onTap: () {
                        Get.to(() => const RecommendationPage(),
                            transition: Transition.cupertino,
                            duration: const Duration(milliseconds: 900));
                      },
                    ),
                    const MedicineList(),
                    Heading(
                      text: "Nearby Pharmacys",
                      onTap: () {
                        Get.to(() => const AllNearbyPharmacys(),
                            transition: Transition.cupertino,
                            duration: const Duration(milliseconds: 900));
                      },
                    ),
                    const NearbyPharmacyList(),
                    Heading(
                      text: "Med Closer to You",
                      onTap: () {
                        Get.to(() => const AllFastestMedicines(),
                            transition: Transition.cupertino,
                            duration: const Duration(milliseconds: 900));
                      },
                    ),
                    const MedicineList(),
                  ],
                )
              : CustomContainer(
                  containerContent: Column(
                  children: [
                    Heading(
                      more: true,
                      text: "Explore ${controller.TitleValue} Category",
                      onTap: () {
                        Get.to(() => const RecommendationPage(),
                            transition: Transition.cupertino,
                            duration: const Duration(milliseconds: 900));
                      },
                    ),
                    const CategoryMedicinesList()
                  ],
                ))),
        ],
      ))),
    );
  }
}
