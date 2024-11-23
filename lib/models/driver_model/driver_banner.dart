// To parse this JSON data, do
//
//     final bannerDriver = bannerDriverFromJson(jsonString);

import 'dart:convert';

BannerDriver bannerDriverFromJson(String str) =>
    BannerDriver.fromJson(json.decode(str));

String bannerDriverToJson(BannerDriver data) => json.encode(data.toJson());

class BannerDriver {
  num? statusCode;
  String? message;
  List<DataBanner>? data;

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
            : List<DataBanner>.from(
                json["data"]!.map((x) => DataBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "StatusCode": statusCode,
        "Message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataBanner {
  num? id;
  String? bannerImage;
  String? role;
  DateTime? createdDate;

  DataBanner({
    this.id,
    this.bannerImage,
    this.role,
    this.createdDate,
  });

  factory DataBanner.fromJson(Map<String, dynamic> json) => DataBanner(
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
