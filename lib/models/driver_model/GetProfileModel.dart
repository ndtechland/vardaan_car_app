// To parse this JSON data, do
//
//     final profileModelDriverGet = profileModelDriverGetFromJson(jsonString);

import 'dart:convert';

ProfileModelDriverGet profileModelDriverGetFromJson(String str) =>
    ProfileModelDriverGet.fromJson(json.decode(str));

String profileModelDriverGetToJson(ProfileModelDriverGet data) =>
    json.encode(data.toJson());

class ProfileModelDriverGet {
  bool? succeeded;
  num? statusCode;
  String? message;
  String? role;
  Data? data;

  ProfileModelDriverGet({
    this.succeeded,
    this.statusCode,
    this.message,
    this.role,
    this.data,
  });

  factory ProfileModelDriverGet.fromJson(Map<String, dynamic> json) =>
      ProfileModelDriverGet(
        succeeded: json["Succeeded"],
        statusCode: json["StatusCode"],
        message: json["Message"],
        role: json["Role"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "Succeeded": succeeded,
        "StatusCode": statusCode,
        "Message": message,
        "Role": role,
        "Data": data?.toJson(),
      };
}

class Data {
  num? id;
  DateTime? createDate;
  String? driverName;
  String? dlNumber;
  String? dlImage;
  String? driverImage;
  String? mobileNumber;
  String? address;
  String? alternateNo1;
  String? email;
  dynamic pincode;
  dynamic driverImageBase64;

  Data({
    this.id,
    this.createDate,
    this.driverName,
    this.dlNumber,
    this.dlImage,
    this.driverImage,
    this.mobileNumber,
    this.address,
    this.alternateNo1,
    this.email,
    this.pincode,
    this.driverImageBase64,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        createDate: json["CreateDate"] == null
            ? null
            : DateTime.parse(json["CreateDate"]),
        driverName: json["DriverName"],
        dlNumber: json["DlNumber"],
        dlImage: json["DlImage"],
        driverImage: json["DriverImage"],
        mobileNumber: json["MobileNumber"],
        address: json["Address"],
        alternateNo1: json["AlternateNo1"],
        email: json["Email"],
        pincode: json["Pincode"],
        driverImageBase64: json["DriverImageBase64"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CreateDate": createDate?.toIso8601String(),
        "DriverName": driverName,
        "DlNumber": dlNumber,
        "DlImage": dlImage,
        "DriverImage": driverImage,
        "MobileNumber": mobileNumber,
        "Address": address,
        "AlternateNo1": alternateNo1,
        "Email": email,
        "Pincode": pincode,
        "DriverImageBase64": driverImageBase64,
      };
}
