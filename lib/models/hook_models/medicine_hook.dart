import 'package:flutter/material.dart';
import 'package:medapp/models/medicines.dart';

class FetchMedicines {
  final List<MedicineModel>? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchMedicines(
      {required this.data,
      required this.isLoading,
      required this.error,
      required this.refetch});
}
