import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:medapp/constants/constants.dart';
import 'package:medapp/models/api_error.dart';
import 'package:medapp/models/hook_models/hook_model.dart';
import 'package:medapp/models/pharmacy.dart';

FetchHook useFetchAllPharmacy(String code) {
  final pharmacys = useState<List<PharmacyModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/pharmacy/all/$code');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        pharmacys.value = pharmacyModelFromJson(response.body);
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

  return FetchHook(
    data: pharmacys.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
