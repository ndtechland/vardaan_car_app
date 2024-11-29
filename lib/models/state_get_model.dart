// To parse this JSON data, do
//
//     final stateModelGet = stateModelGetFromJson(jsonString);

// import 'dart:convert';
//
// StateModelGet stateModelGetFromJson(String str) =>
//     StateModelGet.fromJson(json.decode(str));
//
// String stateModelGetToJson(StateModelGet data) => json.encode(data.toJson());
//
// class StateModelGet {
//   bool? succeeded;
//   int? statusCode;
//   String? message;
//   List<StateModeel>? data;
//
//   StateModelGet({
//     this.succeeded,
//     this.statusCode,
//     this.message,
//     this.data,
//   });
//
//   factory StateModelGet.fromJson(Map<String, dynamic> json) => StateModelGet(
//         succeeded: json["Succeeded"],
//         statusCode: json["StatusCode"],
//         message: json["Message"],
//         data: json["data"] == null
//             ? []
//             : List<StateModeel>.from(
//                 json["data"]!.map((x) => StateModeel.fromJson(x))),
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
// class StateModeel {
//   int? id;
//   String? stateName;
//   int? gst;
//   String? stateCode;
//
//   StateModeel({
//     this.id,
//     this.stateName,
//     this.gst,
//     this.stateCode,
//   });
//
//   factory StateModeel.fromJson(Map<String, dynamic> json) => StateModeel(
//         id: json["Id"],
//         stateName: json["StateName"],
//         gst: json["GST"],
//         stateCode: json["StateCode"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "StateName": stateName,
//         "GST": gst,
//         "StateCode": stateCode,
//       };
// }

///
import 'dart:convert';

StateModelGet stateModelGetFromJson(String str) =>
    StateModelGet.fromJson(json.decode(str));

String stateModelGetToJson(StateModelGet data) => json.encode(data.toJson());

class StateModelGet {
  bool? succeeded;
  int? statusCode;
  String? message;
  List<StateModel>? data;

  StateModelGet({
    this.succeeded,
    this.statusCode,
    this.message,
    this.data,
  });

  factory StateModelGet.fromJson(Map<String, dynamic> json) => StateModelGet(
        succeeded: json["Succeeded"],
        statusCode: json["StatusCode"],
        message: json["Message"],
        data: json["data"] == null
            ? []
            : List<StateModel>.from(
                json["data"]!.map((x) => StateModel.fromJson(x))),
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

class StateModel {
  num? id;
  String? stateName;
  num? gst;
  String? stateCode;

  StateModel({
    this.id,
    this.stateName,
    this.gst,
    this.stateCode,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["Id"],
        stateName: json["StateName"],
        gst: json["GST"],
        stateCode: json["StateCode"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "StateName": stateName,
        "GST": gst,
        "StateCode": stateCode,
      };
}
