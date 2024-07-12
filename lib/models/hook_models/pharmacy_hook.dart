import 'package:flutter/material.dart';
import 'package:medapp/models/pharmacy.dart';

class FetchPharmacy {
  final PharmacyModel? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchPharmacy(
      {required this.data,
      required this.isLoading,
      required this.error,
      required this.refetch});
}
