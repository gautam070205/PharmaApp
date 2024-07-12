import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medapp/controllers/category_controller.dart';
import 'package:medapp/models/categories.dart';
import 'package:medapp/views/categories/category_page.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/constants/constants.dart';

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  final controller = Get.put(CategoryController());
  CategoryTile({
    super.key,
    required this.category,
  });

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        controller.updateCategory = category.id;
        controller.updateTitle = category.title;
        Get.to(() => const CategoryPage(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900));
      },
      leading: CircleAvatar(
        radius: 10.r,
        backgroundColor: kGrayLight,
        child: Image.network(
          category.imageUrl,
          fit: BoxFit.contain,
        ),
      ),
      title: ReusableText(
        text: category.title,
        style: appStyle(12, kGray, FontWeight.normal),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: kGray,
        size: 15.r,
      ),
    );
  }
}
