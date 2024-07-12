import 'package:get/get.dart';

class CategoryController extends GetxController {
  // ignore: prefer_final_fields
  RxString _category = ''.obs;
  String get categoryValue => _category.value;

  set updateCategory(String value) {
    _category.value = value;
  }

  RxString title = ''.obs;
  String get TitleValue => title.value;

  set updateTitle(String value) {
    title.value = value;
  }
}
