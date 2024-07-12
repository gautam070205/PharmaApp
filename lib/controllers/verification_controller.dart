import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/models/api_error.dart';
import 'package:medapp/models/login_response.dart';
import 'package:medapp/views/entrypoint.dart';
import 'package:http/http.dart' as http;

class VerificationController extends GetxController {
  final box = GetStorage();
  String _code = "";
  String get code => _code;
  set setCode(String value) {
    _code = value;
  }

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void verificationfunction() async {
    setLoading = true;
    String accessToken = box.read("token");
    Uri url = Uri.parse('$appBaseUrl/api/users/verify/$code');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        LoginResponse data = loginResponseFromJson(response.body);
        String userId = data.id;
        String userData = jsonEncode(data);
        box.write(userId, userData);
        box.write("token", data.userToken);
        box.write("userId", data.id);

        box.write("verification", data.verification);
        setLoading = false;
        Get.snackbar(
          "You are Successfully Verified",
          "Enjoy Your awesome experience",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: const Icon(Ionicons.medical_outline),
        );
        if (data.verification == true) {
          Get.offAll(
            () => MainScreen(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 900),
          );
        }
        Get.offAll(
          () => MainScreen(),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 900),
        );
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar(
          "Failed to verify",
          error.message,
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: const Icon(Icons.error_outline),
        );
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
