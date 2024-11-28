// To parse this JSON data, do
//
//     final bannerDriver = bannerDriverFromJson(jsonString);

import 'dart:convert';

BannerDriver bannerDriverFromJson(String str) =>
    BannerDriver.fromJson(json.decode(str));

String bannerDriverToJson(BannerDriver data) => json.encode(data.toJson());

class BannerDriver {
  int? statusCode;
  String? message;
  List<Datum>? data;

  BannerDriver({
    this.statusCode,
    this.message,
    this.data,
  });

  factory BannerDriver.fromJson(Map<String, dynamic> json) => BannerDriver(
        statusCode: json["StatusCode"],
        message: json["Message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? bannerImage;
  String? role;
  DateTime? createdDate;

  Datum({
    this.id,
    this.bannerImage,
    this.role,
    this.createdDate,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["Id"],
        bannerImage: json["BannerImage"],
        role: json["Role"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "BannerImage": bannerImage,
        "Role": role,
        "CreatedDate": createdDate?.toIso8601String(),
      };
}
