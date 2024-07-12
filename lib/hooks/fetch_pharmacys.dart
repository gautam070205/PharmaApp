import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:medapp/constants/constants.dart';
import 'package:medapp/models/api_error.dart';
import 'package:medapp/models/hook_models/pharmacy_hook.dart';
import 'package:medapp/models/pharmacy.dart';

FetchPharmacy useFetchPharmacys(String code) {
  final pharmacys = useState<PharmacyModel?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/pharmacy/byId/$code');
      final response = await http.get(url);
      

      if (response.statusCode == 200) {
        var pharmacy = jsonDecode(response.body);
        pharmacys.value = PharmacyModel.fromJson(pharmacy);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchPharmacy(
    data: pharmacys.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
