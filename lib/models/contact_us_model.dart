// To parse this JSON data, do
//
//     final getContactUsModel = getContactUsModelFromJson(jsonString);

import 'dart:convert';

GetContactUsModel getContactUsModelFromJson(String str) =>
    GetContactUsModel.fromJson(json.decode(str));

String getContactUsModelToJson(GetContactUsModel data) =>
    json.encode(data.toJson());

class GetContactUsModel {
  bool? succeeded;
  int? statusCode;
  String? message;
  Data? data;

  GetContactUsModel({
    this.succeeded,
    this.statusCode,
    this.message,
    this.data,
  });

  factory GetContactUsModel.fromJson(Map<String, dynamic> json) =>
      GetContactUsModel(
        succeeded: json["Succeeded"],
        statusCode: json["StatusCode"],
        message: json["Message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "Succeeded": succeeded,
        "StatusCode": statusCode,
        "Message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? headOffice;
  String? branchOne;
  String? branchTwo;
  String? branchThree;
  String? employeeContactNumber;
  String? driverContactNumber;
  String? emailId;
  String? websiteUrl;
  String? employeeEmergencyNumber;
  String? driverEmergencyNumber;
  DateTime? createdDate;

  Data({
    this.id,
    this.headOffice,
    this.branchOne,
    this.branchTwo,
    this.branchThree,
    this.employeeContactNumber,
    this.driverContactNumber,
    this.emailId,
    this.websiteUrl,
    this.employeeEmergencyNumber,
    this.driverEmergencyNumber,
    this.createdDate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        headOffice: json["Head_Office"],
        branchOne: json["Branch_One"],
        branchTwo: json["Branch_Two"],
        branchThree: json["Branch_Three"],
        employeeContactNumber: json["Employee_ContactNumber"],
        driverContactNumber: json["Driver_ContactNumber"],
        emailId: json["Email_Id"],
        websiteUrl: json["Website_URL"],
        employeeEmergencyNumber: json["Employee_EmergencyNumber"],
        driverEmergencyNumber: json["Driver_EmergencyNumber"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Head_Office": headOffice,
        "Branch_One": branchOne,
        "Branch_Two": branchTwo,
        "Branch_Three": branchThree,
        "Employee_ContactNumber": employeeContactNumber,
        "Driver_ContactNumber": driverContactNumber,
        "Email_Id": emailId,
        "Website_URL": websiteUrl,
        "Employee_EmergencyNumber": employeeEmergencyNumber,
        "Driver_EmergencyNumber": driverEmergencyNumber,
        "CreatedDate": createdDate?.toIso8601String(),
      };
}
