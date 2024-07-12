import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/models/pharmacy.dart';
import 'package:medapp/views/Pharmacy/Widgets/explore_widget.dart';
import 'package:medapp/views/Pharmacy/Widgets/pharmacy_bottom_bar.dart';
import 'package:medapp/views/Pharmacy/Widgets/pharmacy_medicines.dart';
import 'package:medapp/views/Pharmacy/Widgets/row_text.dart';
import 'package:medapp/views/Pharmacy/Widgets/pharmacy_top_bar.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({Key? key, required this.pharmacy}) : super(key: key);

  final PharmacyModel? pharmacy;

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose the tab controller properly
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: widget.pharmacy!.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: kPrimary.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.r),
                        topLeft: Radius.circular(12.r),
                      ),
                    ),
                    child: PharmacyBottomBar(widget: widget),
                  ),
                ),
                PharmacyTopBar(widget: widget),
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const RowText(
                    first: "Distance To Pharmacy",
                    second: "2.7 km", // Example distance value
                  ),
                  SizedBox(height: 3.h),
                  const RowText(
                    first: "Estimated Cost",
                    second: "\$2.7", // Example cost value
                  ),
                  SizedBox(height: 3.h),
                  const RowText(
                    first: "Estimated Time",
                    second: "30 min", // Example time value
                  ),
                  const Divider(
                    thickness: 0.7,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                color: kOffWhite,
                height: 25.h,
                width: MediaQuery.of(context).size.width,
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: kLightWhite,
                  labelStyle: appStyle(12, kLightWhite, FontWeight.normal),
                  unselectedLabelColor: kGrayLight,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 25.h,
                        child: const Center(
                          child: Text("Medicines"),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 25.h,
                        child: const Center(
                          child: Text("Explore"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SizedBox(
                height: height,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    PharmacyMedicines(
                      pharmacyId: widget.pharmacy!.id,
                    ),
                    // Replace with different widget or content for the Explore tab
                    ExploreWidget(
                      code: widget.pharmacy!.code,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
