import 'dart:convert';

List<PharmacyModel> pharmacyModelFromJson(String str) =>
    List<PharmacyModel>.from(
        json.decode(str).map((x) => PharmacyModel.fromJson(x)));

String pharmacyModelToJson(List<PharmacyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PharmacyModel {
  final String id;
  final String title;
  final String time;
  final String imageUrl;
  final List<dynamic> medicines;
  final bool pickup;
  final bool delivery;
  final bool isAvailable;
  final String owner;
  final String code;
  final String logoUrl;
  final int rating;
  final String ratingCount;
  final String verification;
  final Coords coords;

  PharmacyModel({
    required this.id,
    required this.title,
    required this.time,
    required this.imageUrl,
    required this.medicines,
    required this.pickup,
    required this.delivery,
    required this.isAvailable,
    required this.owner,
    required this.code,
    required this.logoUrl,
    required this.rating,
    required this.ratingCount,
    required this.verification,
    required this.coords,
  });

  factory PharmacyModel.fromJson(Map<String, dynamic> json) => PharmacyModel(
        id: json["_id"],
        title: json["title"],
        time: json["time"],
        imageUrl: json["imageUrl"],
        medicines: List<dynamic>.from(json["medicines"].map((x) => x)),
        pickup: json["pickup"],
        delivery: json["delivery"],
        isAvailable: json["isAvailable"],
        owner: json["owner"],
        code: json["code"],
        logoUrl: json["logoUrl"],
        rating: json["rating"],
        ratingCount: json["ratingCount"],
        verification: json["verification"],
        coords: Coords.fromJson(json["coords"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "time": time,
        "imageUrl": imageUrl,
        "medicines": List<dynamic>.from(medicines.map((x) => x)),
        "pickup": pickup,
        "delivery": delivery,
        "isAvailable": isAvailable,
        "owner": owner,
        "code": code,
        "logoUrl": logoUrl,
        "rating": rating,
        "ratingCount": ratingCount,
        "verification": verification,
        "coords": coords.toJson(),
      };
}

class Coords {
  final String id;
  final double latitude;
  final double longitude;
  final String address;
  final String title;

  Coords({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.title,
  });

  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        id: json["id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "title": title,
      };
}
