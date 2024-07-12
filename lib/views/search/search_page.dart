import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:medapp/common/custom_container.dart';
import 'package:medapp/common/custom_text_field.dart';
import 'package:medapp/common/shimmers/medicinelist_shimmer.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/controllers/search_controller.dart';
import 'package:medapp/views/search/loading_widget.dart';
import 'package:medapp/views/search/search_results.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // ignore: unused_field
  final TextEditingController _searchController = TextEditingController();
  final controller = Get.put(SearchMedicineController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: kPrimary,
          appBar: AppBar(
            toolbarHeight: 74.h,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: CustomTextField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                hintText: "Search For Medicines",
                suffixIcon: GestureDetector(
                    onTap: () {
                      if (controller.isTriggered == false) {
                        controller.searchMedicines(_searchController.text);
                        controller.setTrigger = true;
                      } else {
                        controller.searchResults = null;
                        controller.setTrigger = false;
                        _searchController.clear();
                      }
                    },
                    child: controller.isTriggered == false
                        ? const Icon(
                            Ionicons.search_circle,
                            size: 40,
                            color: kPrimary,
                          )
                        : const Icon(
                            Ionicons.close_circle,
                            size: 40,
                            color: kRed,
                          )),
              ),
            ),
          ),
          body: SafeArea(
            child: CustomContainer(
                color: Colors.white,
                containerContent: controller.isLoading
                    ? const MedicinelistShimmer()
                    : controller.searchResults == null
                        ? const LoadingWidget()
                        : const SearchResults()),
          ),
        ));
  }
}
