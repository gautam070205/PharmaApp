import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/back_ground_container.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/common/shimmers/categories_shimmer.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/hooks/fetch_all_categories.dart';
import 'package:medapp/models/categories.dart';
import 'package:medapp/views/categories/widgets/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResults.data;
    final isLoading = hookResults.isLoading;
    // ignore: unused_local_variable
    final error = hookResults.error;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kOffWhite,
          title: ReusableText(
            text: "Categories",
            style: appStyle(12, kGray, FontWeight.w600),
          )),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading
            ? const CatergoriesShimmer()
            : ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(categories!.length, (i) {
                  CategoriesModel category = categories[i];
                  return CategoryTile(category: category);
                }),
              ),
      ),
    );
  }
}
