// // To parse this JSON data, do
// //
// //     final employeeLogin = employeeLoginFromJson(jsonString);
//
// import 'dart:convert';
//
// EmployeeLogin employeeLoginFromJson(String str) =>
//     EmployeeLogin.fromJson(json.decode(str));
//
// String employeeLoginToJson(EmployeeLogin data) => json.encode(data.toJson());
//
// class EmployeeLogin {
//   int? status;
//   String? message;
//   String? role;
//   Data? data;
//
//   EmployeeLogin({
//     this.status,
//     this.message,
//     this.role,
//     this.data,
//   });
//
//   factory EmployeeLogin.fromJson(Map<String, dynamic> json) => EmployeeLogin(
//         status: json["Status"],
//         message: json["Message"],
//         role: json["Role"],
//         data: json["Data"] == null ? null : Data.fromJson(json["Data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Status": status,
//         "Message": message,
//         "Role": role,
//         "Data": data?.toJson(),
//       };
// }
//
// class Data {
//   int? id;
//   int? companyId;
//   String? companyLocation;
//   String? employeeId;
//   String? employeeFirstName;
//   String? employeeMiddleName;
//   String? employeeLastName;
//   String? mobileNumber;
//   String? email;
//   int? stateId;
//   int? cityId;
//   int? pincode;
//   String? employeeCurrentAddress;
//   String? loginUserName;
//   String? weekOff;
//   String? employeeGeoCode;
//   String? employeeBusinessUnit;
//   String? employeeDepartment;
//   String? employeeProjectName;
//   String? reportingManager;
//   int? primaryFacilityZone;
//   int? homeRouteName;
//   int? employeeDestinationArea;
//   int? employeeRegistrationType;
//   bool? isActive;
//   DateTime? createdDate;
//   String? password;
//   bool? isFirst;
//   int? otp;
//
//   Data({
//     this.id,
//     this.companyId,
//     this.companyLocation,
//     this.employeeId,
//     this.employeeFirstName,
//     this.employeeMiddleName,
//     this.employeeLastName,
//     this.mobileNumber,
//     this.email,
//     this.stateId,
//     this.cityId,
//     this.pincode,
//     this.employeeCurrentAddress,
//     this.loginUserName,
//     this.weekOff,
//     this.employeeGeoCode,
//     this.employeeBusinessUnit,
//     this.employeeDepartment,
//     this.employeeProjectName,
//     this.reportingManager,
//     this.primaryFacilityZone,
//     this.homeRouteName,
//     this.employeeDestinationArea,
//     this.employeeRegistrationType,
//     this.isActive,
//     this.createdDate,
//     this.password,
//     this.isFirst,
//     this.otp,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["Id"],
//         companyId: json["Company_Id"],
//         companyLocation: json["Company_location"],
//         employeeId: json["Employee_Id"],
//         employeeFirstName: json["Employee_First_Name"],
//         employeeMiddleName: json["Employee_Middle_Name"],
//         employeeLastName: json["Employee_Last_Name"],
//         mobileNumber: json["MobileNumber"],
//         email: json["Email"],
//         stateId: json["StateId"],
//         cityId: json["CityId"],
//         pincode: json["Pincode"],
//         employeeCurrentAddress: json["EmployeeCurrentAddress"],
//         loginUserName: json["LoginUserName"],
//         weekOff: json["WeekOff"],
//         employeeGeoCode: json["EmployeeGeoCode"],
//         employeeBusinessUnit: json["EmployeeBusinessUnit"],
//         employeeDepartment: json["EmployeeDepartment"],
//         employeeProjectName: json["EmployeeProjectName"],
//         reportingManager: json["ReportingManager"],
//         primaryFacilityZone: json["PrimaryFacilityZone"],
//         homeRouteName: json["HomeRouteName"],
//         employeeDestinationArea: json["EmployeeDestinationArea"],
//         employeeRegistrationType: json["EmployeeRegistrationType"],
//         isActive: json["IsActive"],
//         createdDate: json["CreatedDate"] == null
//             ? null
//             : DateTime.parse(json["CreatedDate"]),
//         password: json["Password"],
//         isFirst: json["IsFirst"],
//         otp: json["OTP"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "Company_Id": companyId,
//         "Company_location": companyLocation,
//         "Employee_Id": employeeId,
//         "Employee_First_Name": employeeFirstName,
//         "Employee_Middle_Name": employeeMiddleName,
//         "Employee_Last_Name": employeeLastName,
//         "MobileNumber": mobileNumber,
//         "Email": email,
//         "StateId": stateId,
//         "CityId": cityId,
//         "Pincode": pincode,
//         "EmployeeCurrentAddress": employeeCurrentAddress,
//         "LoginUserName": loginUserName,
//         "WeekOff": weekOff,
//         "EmployeeGeoCode": employeeGeoCode,
//         "EmployeeBusinessUnit": employeeBusinessUnit,
//         "EmployeeDepartment": employeeDepartment,
//         "EmployeeProjectName": employeeProjectName,
//         "ReportingManager": reportingManager,
//         "PrimaryFacilityZone": primaryFacilityZone,
//         "HomeRouteName": homeRouteName,
//         "EmployeeDestinationArea": employeeDestinationArea,
//         "EmployeeRegistrationType": employeeRegistrationType,
//         "IsActive": isActive,
//         "CreatedDate": createdDate?.toIso8601String(),
//         "Password": password,
//         "IsFirst": isFirst,
//         "OTP": otp,
//       };
// }
