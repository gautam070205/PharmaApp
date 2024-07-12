import 'package:get/get.dart';

class AdditiveObs extends GetxController {
  final int id;
  final String title;
  final String price;
  RxBool isChecked = false.obs;
  AdditiveObs(
      {required this.id,
      required this.title,
      required this.price,
      bool Checked = false}) {
    isChecked.value = Checked;
  }
  void toggleChecked() {
    isChecked.value = !isChecked.value;
  }
}
