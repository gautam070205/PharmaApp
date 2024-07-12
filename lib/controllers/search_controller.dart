// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/models/api_error.dart';
import 'package:medapp/models/medicines.dart';
import 'package:http/http.dart' as http;

class SearchMedicineController extends GetxController {
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set setLoading(bool value) {
    _isLoading.value = value;
  }

  RxBool _isTriggered = false.obs;
  bool get isTriggered => _isTriggered.value;
  set setTrigger(bool value) {
    _isTriggered.value = value;
  }

  List<MedicineModel>? searchResults;
  void searchMedicines(String key) async {
    setLoading = true;
    Uri url = Uri.parse("$appBaseUrl/api/medicines/search/$key");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        searchResults = medicineModelFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
        // ignore: unused_local_variable
        var error = apiErrorFromJson(response.body);
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
    }
  }
}
