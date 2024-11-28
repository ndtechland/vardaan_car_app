// // To parse this JSON data, do
// //
// //     final message = messageFromJson(jsonString);
//
// import 'dart:convert';
//
// Message messageFromJson(String str) => Message.fromJson(json.decode(str));
//
// String messageToJson(Message data) => json.encode(data.toJson());
//
// class Message {
//   int? status;
//   String? message;
//   Model? model;
//   String? token;
//
//   Message({
//     this.status,
//     this.message,
//     this.model,
//     this.token,
//   });
//
//   factory Message.fromJson(Map<String, dynamic> json) => Message(
//         status: json["status"],
//         message: json["message"],
//         model: json["model"] == null ? null : Model.fromJson(json["model"]),
//         token: json["token"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "model": model?.toJson(),
//         "token": token,
//       };
// }
//
// class Model {
//   String? id;
//   String? username;
//   String? password;
//
//   Model({
//     this.id,
//     this.username,
//     this.password,
//   });
//
//   factory Model.fromJson(Map<String, dynamic> json) => Model(
//         id: json["id"],
//         username: json["username"],
//         password: json["password"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "username": username,
//         "password": password,
//       };
// }

///
// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  int? status;
  String? message;
  String? role;
  Data? data;

  Message({
    this.status,
    this.message,
    this.role,
    this.data,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        status: json["Status"],
        message: json["Message"],
        role: json["Role"],
        data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Role": role,
        "Data": data?.toJson(),
      };
}

class Data {
  int? id;
  DateTime? createDate;
  String? driverName;
  String? dlNumber;
  String? dlImage;
  String? aadharNo;
  String? aadharImage;
  String? driverImage;
  bool? isActive;
  String? mobileNumber;
  bool? isAvailable;
  String? driverAddress;
  dynamic policeVerificationNo;
  DateTime? licenceExpDate;
  String? polVerifImg;
  String? fatherName;
  String? alternateNo1;
  String? alternateNo2;
  String? localAddress;
  String? permanentAddress;
  String? panImage;
  String? panNumber;
  bool? isOutsider;
  bool? isFirst;
  String? password;
  int? otp;
  String? email;

  Data({
    this.id,
    this.createDate,
    this.driverName,
    this.dlNumber,
    this.dlImage,
    this.aadharNo,
    this.aadharImage,
    this.driverImage,
    this.isActive,
    this.mobileNumber,
    this.isAvailable,
    this.driverAddress,
    this.policeVerificationNo,
    this.licenceExpDate,
    this.polVerifImg,
    this.fatherName,
    this.alternateNo1,
    this.alternateNo2,
    this.localAddress,
    this.permanentAddress,
    this.panImage,
    this.panNumber,
    this.isOutsider,
    this.isFirst,
    this.password,
    this.otp,
    this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        createDate: json["CreateDate"] == null
            ? null
            : DateTime.parse(json["CreateDate"]),
        driverName: json["DriverName"],
        dlNumber: json["DlNumber"],
        dlImage: json["DlImage"],
        aadharNo: json["AadharNo"],
        aadharImage: json["AadharImage"],
        driverImage: json["DriverImage"],
        isActive: json["IsActive"],
        mobileNumber: json["MobileNumber"],
        isAvailable: json["IsAvailable"],
        driverAddress: json["DriverAddress"],
        policeVerificationNo: json["PoliceVerificationNo"],
        licenceExpDate: json["LicenceExpDate"] == null
            ? null
            : DateTime.parse(json["LicenceExpDate"]),
        polVerifImg: json["PolVerifImg"],
        fatherName: json["FatherName"],
        alternateNo1: json["AlternateNo1"],
        alternateNo2: json["AlternateNo2"],
        localAddress: json["LocalAddress"],
        permanentAddress: json["PermanentAddress"],
        panImage: json["PanImage"],
        panNumber: json["PanNumber"],
        isOutsider: json["IsOutsider"],
        isFirst: json["IsFirst"],
        password: json["Password"],
        otp: json["OTP"],
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CreateDate": createDate?.toIso8601String(),
        "DriverName": driverName,
        "DlNumber": dlNumber,
        "DlImage": dlImage,
        "AadharNo": aadharNo,
        "AadharImage": aadharImage,
        "DriverImage": driverImage,
        "IsActive": isActive,
        "MobileNumber": mobileNumber,
        "IsAvailable": isAvailable,
        "DriverAddress": driverAddress,
        "PoliceVerificationNo": policeVerificationNo,
        "LicenceExpDate": licenceExpDate?.toIso8601String(),
        "PolVerifImg": polVerifImg,
        "FatherName": fatherName,
        "AlternateNo1": alternateNo1,
        "AlternateNo2": alternateNo2,
        "LocalAddress": localAddress,
        "PermanentAddress": permanentAddress,
        "PanImage": panImage,
        "PanNumber": panNumber,
        "IsOutsider": isOutsider,
        "IsFirst": isFirst,
        "Password": password,
        "OTP": otp,
        "Email": email,
      };
}
