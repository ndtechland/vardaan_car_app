// To parse this JSON data, do
//
//     final cityModelGet = cityModelGetFromJson(jsonString);

import 'dart:convert';

CityModelGet cityModelGetFromJson(String str) =>
    CityModelGet.fromJson(json.decode(str));

String cityModelGetToJson(CityModelGet data) => json.encode(data.toJson());

class CityModelGet {
  bool? succeeded;
  int? statusCode;
  String? message;
  List<CityModel>? data;

  CityModelGet({
    this.succeeded,
    this.statusCode,
    this.message,
    this.data,
  });

  factory CityModelGet.fromJson(Map<String, dynamic> json) => CityModelGet(
        succeeded: json["Succeeded"],
        statusCode: json["StatusCode"],
        message: json["Message"],
        data: json["data"] == null
            ? []
            : List<CityModel>.from(
                json["data"]!.map((x) => CityModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Succeeded": succeeded,
        "StatusCode": statusCode,
        "Message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CityModel {
  int? id;
  String? cityName;
  int? stateMasterId;

  CityModel({
    this.id,
    this.cityName,
    this.stateMasterId,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["Id"],
        cityName: json["CityName"],
        stateMasterId: json["StateMaster_Id"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CityName": cityName,
        "StateMaster_Id": stateMasterId,
      };
}

///

// CityModelGet cityModelGetFromJson(String str) =>
//     CityModelGet.fromJson(json.decode(str));
//
// String cityModelGetToJson(CityModelGet data) => json.encode(data.toJson());
//
// class CityModelGet {
//   bool? succeeded;
//   int? statusCode;
//   String? message;
//   List<CityModeeel>? data;
//
//   CityModelGet({
//     this.succeeded,
//     this.statusCode,
//     this.message,
//     this.data,
//   });
//
//   factory CityModelGet.fromJson(Map<String, dynamic> json) => CityModelGet(
//         succeeded: json["Succeeded"],
//         statusCode: json["StatusCode"],
//         message: json["Message"],
//         data: json["data"] == null
//             ? []
//             : List<CityModeeel>.from(
//                 json["data"]!.map((x) => CityModeeel.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Succeeded": succeeded,
//         "StatusCode": statusCode,
//         "Message": message,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }
//
// class CityModeeel {
//   int? id;
//   String? cityName;
//   int? stateMasterId;
//
//   CityModeeel({
//     this.id,
//     this.cityName,
//     this.stateMasterId,
//   });
//
//   factory CityModeeel.fromJson(Map<String, dynamic> json) => CityModeeel(
//         id: json["Id"],
//         cityName: json["CityName"],
//         stateMasterId: json["StateMaster_Id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "CityName": cityName,
//         "StateMaster_Id": stateMasterId,
//       };
// }
