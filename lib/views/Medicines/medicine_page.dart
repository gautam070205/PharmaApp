import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/custom_button.dart';
import 'package:medapp/common/custom_text_field.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/controllers/medicine_controller.dart';
import 'package:medapp/hooks/fetch_pharmacys.dart';
import 'package:medapp/models/medicines.dart';
import 'package:medapp/views/auth/phone_verification_page.dart';

class MedicinePage extends StatefulHookWidget {
  const MedicinePage({super.key, required this.medicine});
  final MedicineModel medicine;

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  final TextEditingController _preferences = TextEditingController();
  final PageController _pageController = PageController();
  late final MedicineController controller;

  @override
  void dispose() {
    _preferences.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MedicineController());
    final hookResults = useFetchPharmacys(widget.medicine.pharmacy);
    controller.loadAdditives(widget.medicine.additives);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.r),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    height: 230.h,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (i) {
                        controller.changePage(i);
                      },
                      itemCount: widget.medicine.imageUrl.length,
                      itemBuilder: (context, i) {
                        return Container(
                          width: double.infinity,
                          height: 230.h,
                          color: kLightWhite,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.medicine.imageUrl[i],
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(widget.medicine.imageUrl.length,
                            (index) {
                          return Container(
                            margin: EdgeInsets.all(4.h),
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.currentPage.value == index
                                  ? kSecondary
                                  : kGrayLight,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    left: 12.w,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Ionicons.chevron_back_circle,
                        color: kPrimary,
                      ),
                    ),
                  ),

                  // Positioned(
                  //   bottom: 10,
                  //   right: 12.w,
                  //   child: CustomButton(
                  //     onTap: () {
                  //       Get.to(() => PharmacyPage(pharmacy: hookResults.data!));
                  //     },
                  //     btnWidth: 120.w,
                  //     text: "Open Pharmacy",
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: widget.medicine.title,
                        style: appStyle(18, kDark, FontWeight.w600),
                      ),
                      Obx(
                        () => ReusableText(
                          text:
                              "\$ ${((widget.medicine.price + controller.additivePrice) * controller.count.value)}",
                          style: appStyle(18, kPrimary, FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    widget.medicine.description,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                    style: appStyle(11, kGray, FontWeight.w600),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 18.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          widget.medicine.medicineTags.length, (index) {
                        final tag = widget.medicine.medicineTags[index];
                        return Container(
                          margin: EdgeInsets.only(right: 5.w),
                          decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: ReusableText(
                              text: tag,
                              style: appStyle(11, kDark, FontWeight.w400),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  ReusableText(
                    text: "Additional Items You can Buy",
                    style: appStyle(18, kDark, FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  Obx(() => Column(
                        children: List.generate(controller.additivesList.length,
                            (index) {
                          final additive = controller.additivesList[index];
                          return CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            dense: true,
                            activeColor: kSecondary,
                            value: additive.isChecked.value,
                            tristate: false,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReusableText(
                                  text: additive.title,
                                  style: appStyle(11, kDark, FontWeight.w400),
                                ),
                                SizedBox(width: 5.w),
                                ReusableText(
                                  text: "\$ ${additive.price}",
                                  style:
                                      appStyle(11, kPrimary, FontWeight.w600),
                                ),
                              ],
                            ),
                            onChanged: (bool? value) {
                              additive.toggleChecked();
                              controller.getTotalPrice();
                            },
                          );
                        }),
                      )),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: "Quantity",
                        style: appStyle(18, kDark, FontWeight.w600),
                      ),
                      SizedBox(width: 5.w),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.increment();
                            },
                            child: const Icon(AntDesign.pluscircle),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Obx(
                              () => ReusableText(
                                text: "${controller.count.value}",
                                style: appStyle(14, kDark, FontWeight.w600),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.decrement();
                            },
                            child: const Icon(AntDesign.minuscircle),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ReusableText(
                    text: "Preferences",
                    style: appStyle(18, kDark, FontWeight.w600),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 65.h,
                    child: CustomTextField(
                      controller: _preferences,
                      hintText: "Add a note with Your Preference",
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showVerificationSheet(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: ReusableText(
                              text: "Place Order",
                              style: appStyle(15, kLightWhite, FontWeight.w600),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: kLightWhite,
                            radius: 20.r,
                            child: const Icon(
                              Ionicons.cart,
                              color: kPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showVerificationSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Container(
          height: 500.h,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pharmacy2_bk.png"),
              fit: BoxFit.fill,
            ),
            color: kLightWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                ReusableText(
                  text: "Verify Your Phone Number",
                  style: appStyle(18, kPrimary, FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children:
                          List.generate(verificationReasons.length, (index) {
                        return ListTile(
                          leading: const Icon(
                            Icons.check_circle_outline,
                            color: kPrimary,
                          ),
                          title: Text(
                            verificationReasons[index],
                            textAlign: TextAlign.justify,
                            style: appStyle(11, kGrayLight, FontWeight.normal),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                CustomButton(
                  text: "Verify Phone Number",
                  btnHeight: 35.h,
                  onTap: () {
                    Get.to(() => const PhoneVerificationPage());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
