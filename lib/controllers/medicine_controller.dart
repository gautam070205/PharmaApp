import 'package:get/get.dart';
import 'package:medapp/models/additive_obs.dart';
import 'package:medapp/models/medicines.dart';

class MedicineController extends GetxController {
  RxInt currentPage = 0.obs;
  bool initialCheckValue = false;
  var additivesList = <AdditiveObs>[].obs;
  RxDouble _totalPrice = 0.0.obs;
  double get additivePrice => _totalPrice.value;
  void changePage(int index) {
    currentPage.value = index;
  }

  RxInt count = 1.obs;
  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadAdditives(List<Additive> additives) {
    additivesList.clear();
    for (var additiveInfo in additives) {
      var additive = AdditiveObs(
          id: additiveInfo.id,
          title: additiveInfo.title,
          price: additiveInfo.price,
          Checked: initialCheckValue);
      if (additives.length == additivesList.length) {
      } else {
        additivesList.add(additive);
      }
    }
  }

  set setTotalPrice(double newPrice) {
    _totalPrice.value = newPrice;
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var additive in additivesList) {
      if (additive.isChecked.value) {
        totalPrice += double.tryParse(additive.price) ?? 0.0;
      }
    }
    setTotalPrice = totalPrice;
    return totalPrice;
  }
}
