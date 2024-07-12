import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medapp/common/shimmers/categories_shimmer.dart';
import 'package:medapp/controllers/category_controller.dart';
import 'package:medapp/hooks/fetch_categories.dart';
import 'package:medapp/models/categories.dart';
import 'package:medapp/views/home/widgets/category_widget.dart';

class CategoryList extends HookWidget {
  // ignore: use_super_parameters
  CategoryList({super.key});

  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoriesModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    // ignore: unused_local_variable
    final error = hookResult.error;
    return isLoading
        ? const CatergoriesShimmer()
        : Container(
            height: 80.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: isLoading
                ? const CatergoriesShimmer()
                : ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(categoriesList!.length, (i) {
                      CategoriesModel category = categoriesList[i];
                      return CategoryWiget(category: category);
                    }),
                  ),
          );
  }
}
