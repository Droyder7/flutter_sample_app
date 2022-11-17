// To parse this JSON data, do
//
//     final hotel = hotelFromJson(jsonString);

import 'dart:convert';

List<Hotel> hotelFromJson(dynamic json) =>
    List<Hotel>.from(json.map((x) => Hotel.fromJson(x)));

String hotelToJson(List<Hotel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hotel {
  Hotel({
    required this.address,
    required this.altImages,
    required this.checkInTime,
    required this.checkOutTime,
    required this.description,
    required this.id,
    required this.location,
    required this.mainImage,
    required this.phoneNo,
    required this.propertyType,
    required this.rating,
    required this.title,
  });

  Address address;
  List<AltImage> altImages;
  CheckInTime checkInTime;
  DateTime checkOutTime;
  String description;
  int id;
  Location location;
  MainImage mainImage;
  PhoneNo phoneNo;
  String propertyType;
  int rating;
  String title;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        address: Address.fromJson(json["address"]),
        altImages: List<AltImage>.from(
            json["altImages"].map((x) => AltImage.fromJson(x))),
        checkInTime: CheckInTime.fromJson(json["checkInTime"]),
        checkOutTime: DateTime.parse(json["checkOutTime"]),
        description: json["description"],
        id: json["id"],
        location: Location.fromJson(json["location"]),
        mainImage: MainImage.fromJson(json["mainImage"]),
        phoneNo: PhoneNo.fromJson(json["phoneNo"]),
        propertyType: json["propertyType"],
        rating: json["rating"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "altImages": List<dynamic>.from(altImages.map((x) => x.toJson())),
        "checkInTime": checkInTime.toJson(),
        "checkOutTime": checkOutTime.toIso8601String(),
        "description": description,
        "id": id,
        "location": location.toJson(),
        "mainImage": mainImage.toJson(),
        "phoneNo": phoneNo.toJson(),
        "propertyType": propertyType,
        "rating": rating,
        "title": title,
      };
}

class Address {
  Address({
    required this.city,
    required this.country,
    required this.line1,
    required this.postalCode,
    required this.state,
  });

  String city;
  String country;
  String line1;
  int postalCode;
  String state;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        country: json["country"],
        line1: json["line1"],
        postalCode: json["postalCode"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "country": country,
        "line1": line1,
        "postalCode": postalCode,
        "state": state,
      };
}

class AltImage {
  AltImage({
    required this.key,
    required this.type,
    required this.asset,
  });

  String key;
  String type;
  Asset asset;

  factory AltImage.fromJson(Map<String, dynamic> json) => AltImage(
        key: json["_key"],
        type: json["_type"],
        asset: Asset.fromJson(json["asset"]),
      );

  Map<String, dynamic> toJson() => {
        "_key": key,
        "_type": type,
        "asset": asset.toJson(),
      };
}

class Asset {
  Asset({
    required this.ref,
    required this.type,
  });

  String ref;
  String type;

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        ref: json["_ref"],
        type: json["_type"],
      );

  Map<String, dynamic> toJson() => {
        "_ref": ref,
        "_type": type,
      };
}

class CheckInTime {
  CheckInTime({
    required this.type,
    required this.ampm,
    required this.hour,
    required this.minute,
  });

  String type;
  String ampm;
  int hour;
  int minute;

  factory CheckInTime.fromJson(Map<String, dynamic> json) => CheckInTime(
        type: json["_type"],
        ampm: json["ampm"],
        hour: json["hour"],
        minute: json["minute"],
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "ampm": ampm,
        "hour": hour,
        "minute": minute,
      };
}

class Location {
  Location({
    required this.type,
    required this.alt,
    required this.lat,
    required this.lng,
  });

  String type;
  int alt;
  double lat;
  double lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["_type"],
        alt: json["alt"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "alt": alt,
        "lat": lat,
        "lng": lng,
      };
}

class MainImage {
  MainImage({
    required this.type,
    required this.asset,
  });

  String type;
  Asset asset;

  factory MainImage.fromJson(Map<String, dynamic> json) => MainImage(
        type: json["_type"],
        asset: Asset.fromJson(json["asset"]),
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "asset": asset.toJson(),
      };
}

class PhoneNo {
  PhoneNo({
    required this.countryCode,
    required this.number,
  });

  int countryCode;
  int number;

  factory PhoneNo.fromJson(Map<String, dynamic> json) => PhoneNo(
        countryCode: json["countryCode"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "number": number,
      };
}
