import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:medapp/constants/constants.dart';
// import 'package:medapp/constants/constants.dart';
import 'package:medapp/models/api_error.dart';
import 'package:medapp/models/hook_models/medicine_hook.dart';
import 'package:medapp/models/medicines.dart';
// import 'package:medapp/models/hook_models/hook_model.dart';

FetchMedicines useFetchMedicines(String code) {
  final medicines = useState<List<MedicineModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse('$appBaseUrl/api/medicines/recommendation/$code');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        medicines.value = medicineModelFromJson(response.body);
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
    Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchMedicines(
    data: medicines.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
