import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medapp/common/shimmers/medicinelist_shimmer.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/controllers/search_controller.dart';
import 'package:medapp/models/medicines.dart';
import 'package:medapp/views/home/widgets/medicine_tile.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchMedicineController());
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      height: height,
      child: controller.isLoading
          ? const MedicinelistShimmer()
          : ListView.builder(
              itemCount: controller.searchResults!.length,
              itemBuilder: (context, i) {
                MedicineModel medicine = controller.searchResults![i];
                return MedicineTile(medicine: medicine);
              }),
    );
  }
}
