// To parse this JSON data, do
//
//     final profileModelEmployeeGet = profileModelEmployeeGetFromJson(jsonString);

import 'dart:convert';

ProfileModelEmployeeGet profileModelEmployeeGetFromJson(String str) =>
    ProfileModelEmployeeGet.fromJson(json.decode(str));

String profileModelEmployeeGetToJson(ProfileModelEmployeeGet data) =>
    json.encode(data.toJson());

class ProfileModelEmployeeGet {
  bool? succeeded;
  int? statusCode;
  String? message;
  String? role;
  Data? data;

  ProfileModelEmployeeGet({
    this.succeeded,
    this.statusCode,
    this.message,
    this.role,
    this.data,
  });

  factory ProfileModelEmployeeGet.fromJson(Map<String, dynamic> json) =>
      ProfileModelEmployeeGet(
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
  int? id;
  String? employeeId;
  String? employeeFirstName;
  String? employeeMiddleName;
  String? employeeLastName;
  String? mobileNumber;
  String? emergencyContactNumber;
  String? email;
  String? stateName;
  String? cityName;
  int? stateId;
  int? cityId;
  int? pincode;
  dynamic employeeCurrentAddress;
  String? employeeDepartment;
  dynamic employeePic;
  DateTime? createdDate;

  Data({
    this.id,
    this.employeeId,
    this.employeeFirstName,
    this.employeeMiddleName,
    this.employeeLastName,
    this.mobileNumber,
    this.emergencyContactNumber,
    this.email,
    this.stateName,
    this.cityName,
    this.stateId,
    this.cityId,
    this.pincode,
    this.employeeCurrentAddress,
    this.employeeDepartment,
    this.employeePic,
    this.createdDate,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        employeeId: json["Employee_Id"],
        employeeFirstName: json["Employee_First_Name"],
        employeeMiddleName: json["Employee_Middle_Name"],
        employeeLastName: json["Employee_Last_Name"],
        mobileNumber: json["MobileNumber"],
        emergencyContactNumber: json["EmergencyContactNumber"],
        email: json["Email"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        stateId: json["StateId"],
        cityId: json["CityId"],
        pincode: json["Pincode"],
        employeeCurrentAddress: json["EmployeeCurrentAddress"],
        employeeDepartment: json["EmployeeDepartment"],
        employeePic: json["EmployeePic"],
        createdDate: json["CreatedDate"] == null
            ? null
            : DateTime.parse(json["CreatedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Employee_Id": employeeId,
        "Employee_First_Name": employeeFirstName,
        "Employee_Middle_Name": employeeMiddleName,
        "Employee_Last_Name": employeeLastName,
        "MobileNumber": mobileNumber,
        "EmergencyContactNumber": emergencyContactNumber,
        "Email": email,
        "StateName": stateName,
        "CityName": cityName,
        "StateId": stateId,
        "CityId": cityId,
        "Pincode": pincode,
        "EmployeeCurrentAddress": employeeCurrentAddress,
        "EmployeeDepartment": employeeDepartment,
        "EmployeePic": employeePic,
        "CreatedDate": createdDate?.toIso8601String(),
      };
}
