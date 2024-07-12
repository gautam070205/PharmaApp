import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:medapp/common/shimmers/medicinelist_shimmer.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/hooks/medicines_by_pharmacy.dart';
import 'package:medapp/models/medicines.dart';
import 'package:medapp/views/home/widgets/medicine_tile.dart';

class PharmacyMedicines extends HookWidget {
  const PharmacyMedicines({
    Key? key,
    required this.pharmacyId,
  }) : super(key: key);

  final String pharmacyId;

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchPharmacyMedicine(pharmacyId);
    final medicines = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      backgroundColor: kLightWhite,
      body: isLoading
          ? const MedicinelistShimmer()
          : Container(
              height: height * 0.7,
              child: ListView(
                padding: EdgeInsets.zero,
                children: List.generate(medicines!.length, (index) {
                  final MedicineModel medicine = medicines[index];
                  return MedicineTile(medicine: medicine);
                }),
              ),
            ),
    );
  }
}
