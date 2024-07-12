import 'dart:convert';

List<MedicineModel> medicineModelFromJson(String str) =>
    List<MedicineModel>.from(
        json.decode(str).map((x) => MedicineModel.fromJson(x)));

String medicineModelToJson(List<MedicineModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicineModel {
  final String id;
  final String title;
  final String time;
  final List<String> medicineTags;
  final String category;
  final List<dynamic> medicineType;
  final String code;
  final bool isAvailable;
  final String pharmacy;
  final int rating;
  final String ratingCount;
  final String description;
  final double price;
  final List<Additive> additives;
  final List<String> imageUrl;

  MedicineModel({
    required this.id,
    required this.title,
    required this.time,
    required this.medicineTags,
    required this.category,
    required this.medicineType,
    required this.code,
    required this.isAvailable,
    required this.pharmacy,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.price,
    required this.additives,
    required this.imageUrl,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        medicineTags: List<String>.from(json["medicineTags"].map((x) => x)),
        category: json["category"],
        medicineType: List<dynamic>.from(json["medicineType"].map((x) => x)),
        code: json["code"],
        isAvailable: json["isAvailable"],
        pharmacy: json["pharmacy"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        additives: List<Additive>.from(
            json["additives"].map((x) => Additive.fromJson(x))),
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "medicineTags": List<dynamic>.from(medicineTags.map((x) => x)),
        "category": category,
        "medicineType": List<dynamic>.from(medicineType.map((x) => x)),
        "code": code,
        "isAvailable": isAvailable,
        "pharmacy": pharmacy,
        "rating": rating,
        "ratingCount": ratingCount,
        "description": description,
        "price": price,
        "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
      };
}

class Additive {
  final int id;
  final String title;
  final String price;

  Additive({
    required this.id,
    required this.title,
    required this.price,
  });

  factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        id: json["id"],
        title: json["title"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
      };
}
