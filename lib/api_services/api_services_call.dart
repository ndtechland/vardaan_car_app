import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../contantss/fixed_text_for_api.dart';
import '../models/contact_us_model.dart';
import '../models/driver_model/GetProfileModel.dart';
import '../models/driver_model/driver_banner.dart';
import '../models/employee_model/bookin_request_model/get_drop_shift_time_model.dart';
import '../models/employee_model/bookin_request_model/get_pickup_shift_time_model.dart';
import '../models/employee_model/bookin_request_model/get_shift_type_model.dart';
import '../models/employee_model/bookin_request_model/trip_type_model.dart';
import '../models/employee_model/employee_grt_profile_model.dart';
import '../models/get_city_model.dart';
import '../models/state_get_model.dart';
import '../module/driver/home_page_driver.dart';
import '../module/user/create_password_employee.dart';
import '../module/user/home_page.dart';

var prefs = GetStorage();

class ApiProvider {
  static var baseUrl = FixedText.apiurl;
  static String token = '';

  ///static String Id = '';
  static String MedicineId = ''.toString();
  static String adminId = ''.toString();

  //static String userid = ''.toString();
  static String userId = ''.toString();
  static String employeeId = ''.toString();

  static String role = ''.toString();

  final box = GetStorage();

  ///todo: 1. vardaan cab....login user.and driver.
  Future<http.Response> Logindriveruser(String mobileNumber) async {
    final url = Uri.parse("${baseUrl}api/Account/LoginMaster");
    final response = await http.post(
      url,
      body: {"UserName": mobileNumber},
    );
    return response;
  }

  ///todo: 2. vardaan car api otp or password.....

  Future<Map<String, dynamic>> verifyOtpOrPassword(
      String mobileNumber, String otp) async {
    final url = Uri.parse("${baseUrl}api/Account/VerifieyOtpOrPassword");
    //

    final body = {
      "UserName": mobileNumber,
      "OTP": otp,
    };

    // Print the body before making the request
    print("Request Body before sending the request: $body");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      // Print the body again after the response
      print("Request Body after receiving the response: $body");

      if (response.statusCode == 200) {
        print("Request Body after 200: $body");
        print("Request Body after 200: $body");

        print("Response after 200: ${response.body}");
        final responseData = json.decode(response.body);

        // Extract data
        int userId = responseData["Data"]["Id"];
        String mobile = responseData["Data"]["MobileNumber"];
        String role = responseData["Role"];

        // Save user data locally
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt("userId", userId);
        await prefs.setString("mobileNumber", mobile);
        await prefs.setString("role", role);

        print("User ID: $userId");
        print("Mobile Number: $mobile");
        print("Role: $role");

        //routing..

        // Navigate to the respective home page
        if (role.toLowerCase() == "driver") {
          await Future.delayed(Duration(seconds: 2));
          await Get.to(() => HomePageDriver());
        } else {
          //await Future.delayed(Duration(seconds: 2));

          //CreatePasswordEmployee
          Get.to(() => CreatePasswordEmployee());

          //Get.to(() => HomePage());
        }

        // Print the response body after 200 status code
        print("Response after 200: ${response.body}");

        // Decode the response and return it

        return json.decode(response.body);
      } else {
        throw Exception('Failed to verify OTP or password');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  ///todo: 3. vardaan car api  password.....
  Future<Map<String, dynamic>> verifyPassword(
      String mobileNumber, String password) async {
    final url = Uri.parse("${baseUrl}api/Account/VerifieyOtpOrPassword");

    final body = {
      "UserName": mobileNumber,
      "Password": password,
    };

    print("Request Body: $body");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        print("Request Body after 200pass: $body");
        print("Request Body after 200pass: $body");

        print("Response after 200: ${response.body}");
        // final responseData = json.decode(response.body);

        // Extract data
        int userId = responseData["Data"]["Id"];
        String mobile = responseData["Data"]["MobileNumber"];
        String role = responseData["Role"];

        // Save user data locally
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt("userId", userId);
        await prefs.setString("mobileNumber", mobile);
        await prefs.setString("role", role);

        print("User ID pass: $userId");
        print("Mobile Number pass: $mobile");
        print("Role pass: $role");

        ///end share preference

        // Check if Data and Role keys exist
        if (responseData.containsKey("Data") &&
            responseData.containsKey("Role")) {
          final data = responseData["Data"];

          // Validate 'Id' field
          if (data.containsKey("Id")) {
            int userId = data["Id"];
            String mobile = data["MobileNumber"];
            String role = responseData["Role"];

            // Save data in GetStorage
            final storage = GetStorage();
            storage.write("userId", userId);
            storage.write("mobileNumber", mobile);
            storage.write("role", role);

            print("User data saved successfully in GetStorage.");

            // Navigate based on role
            if (role.toLowerCase() == "driver") {
              Get.to(() => HomePageDriver());
            } else {
              Get.to(() => HomePage());
            }

            return responseData;
          } else {
            throw Exception("User ID (Id) not found in response data.");
          }
        } else {
          throw Exception("Expected keys not found in response.");
        }
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        throw Exception('Failed to verify OTP or password.');
      }
    } catch (e) {
      print("Error: $e");
      throw Exception('Error: $e');
    }
  }

  ///

  ///todo: 4. get profile driver......
  static Future<dynamic> GetDriverProfileApi() async {
    try {
      // Retrieve the saved ID from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt("userId");

      if (userId == null) {
        throw Exception("User ID is not saved in SharedPreferences.");
      }

      // Use the dynamic ID in the API URL
      var url = "${baseUrl}api/Driver/GetDriverProfile?id=$userId";
      print("API URL: $url");

      http.Response response = await http.get(Uri.parse(url));
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        var GetDriverprofileModel =
            profileModelDriverGetFromJson(response.body);
        return GetDriverprofileModel;
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (error) {
      print("Error: $error");
      return null;
    }
  }

  ///todo: 5. change password api,,,,for employee.......
  static Future<http.Response?> ChangePasswordDriverApi(
      BuildContext context, // Added context parameter
      String CurrentPassword,
      String NewPassword,
      String ConfirmPassword) async {
    // var prefs = GetStorage();

    // Read saved userId
    //String employeeId = prefs.read("Id").toString();
    //print('wwwuseridEE:$employeeId');

    // Retrieve the saved ID from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("userId");

    if (userId == null) {
      throw Exception("User ID is not saved in SharedPreferences.");
    }

    //employeeId

    var url = "${baseUrl}api/Account/DriverChangePassword";
    var body = jsonEncode({
      "Id": "$userId",
      "OldPassword": CurrentPassword,
      "Password": NewPassword,
      "ConfirmPassword": ConfirmPassword,
    });

    print("loginnnn");
    print(body);

    try {
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 10));

      print(r.body);

      if (r.statusCode == 200) {
        var responseData = json.decode(r.body);
        // var userId = responseData['loginProfile']['id'];

        // Save user ID (assuming 'Id' is part of the response JSON)
        // prefs.write("Id", userId);
        //  print('Saved userId: $userId');

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // Simulate a delay for async operations
        await Future.delayed(Duration(seconds: 1));

        // Clear shared preferences
        SharedPreferences.getInstance().then((prefs) => prefs.clear());

        // Hide loading dialog
        Get.back();

        // Navigate to Login Page
        ///Get.offAll(() => Login());

        // Show success toast
        Fluttertoast.showToast(
          msg: "Password changed successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      } else if (r.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized access. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to change password. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      }

      return r;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
        msg: "Network connection slow or disconnected",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg:
            "Network error: Unable to resolve host. Please check your internet connection.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } catch (error) {
      print('Network error: $error');

      Fluttertoast.showToast(
        msg: "Network error: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    }
  }

  ///todo: 6. forget password api,,,,for employee.......
  static Future<http.Response?> ForgotPasswordDriverApi(
    BuildContext context, // Added context parameter
    String CurrentEmail,
  ) async {
    var prefs = GetStorage();

    // Read saved userId
    String employeeId = prefs.read("Id").toString();
    print('wwwuseridEE:$employeeId');
    //employeeId

    var url = "${baseUrl}api/Account/DriverForgotPassword";
    var body = jsonEncode({
      "EmailId": CurrentEmail,
    });

    print("loginnnn");
    print(body);

    try {
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 10));

      print(r.body);

      if (r.statusCode == 200) {
        var responseData = json.decode(r.body);
        // var userId = responseData['loginProfile']['id'];

        // Save user ID (assuming 'Id' is part of the response JSON)
        // prefs.write("Id", userId);
        //  print('Saved userId: $userId');

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // Simulate a delay for async operations
        await Future.delayed(Duration(seconds: 1));

        // Clear shared preferences
        SharedPreferences.getInstance().then((prefs) => prefs.clear());

        // Hide loading dialog
        Get.back();

        // Navigate to Login Page
        ///Get.offAll(() => Login());

        // Show success toast
        Fluttertoast.showToast(
          msg: "Password sent on your Registered Email.",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      } else if (r.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized access. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to forgot password. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      }

      return r;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
        msg: "Network connection slow or disconnected",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg:
            "Network error: Unable to resolve host. Please check your internet connection.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } catch (error) {
      print('Network error: $error');

      Fluttertoast.showToast(
        msg: "Network error: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    }
  }

  ///todo: 7. profile update ...driver...
  static Future<http.Response?> UpdateProfileDriverApi(
      BuildContext context, // Added context parameter
      String DriverName,
      String Email,
      String Address,
      String AlternateNo1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("userId");

    if (userId == null) {
      throw Exception("User ID is not saved in SharedPreferences.");
    }

    //employeeId

    var url = "${baseUrl}api/Driver/UpdateDriverProfile";
    var body = jsonEncode({
      "Id": "$userId",
      "DriverName": DriverName,
      "Email": Email,
      "Address": Address,
      "AlternateNo1": AlternateNo1
    });

    print("profile dvr update");
    print(body);

    try {
      http.Response r = await http.put(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 10));

      print(r.body);
      print("Response driver profile before 200: ${r.body}");

      if (r.statusCode == 200) {
        var responseData = json.decode(r.body);
        print("Response driver profile after 200: ${r.body}");
        // var userId = responseData['loginProfile']['id'];

        // Save user ID (assuming 'Id' is part of the response JSON)
        // prefs.write("Id", userId);
        //  print('Saved userId: $userId');

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // Simulate a delay for async operations
        await Future.delayed(Duration(seconds: 1));

        // Clear shared preferences
        // SharedPreferences.getInstance().then((prefs) => prefs.clear());

        // Hide loading dialog
        Get.back();

        // Navigate to Login Page
        ///Get.offAll(() => Login());

        // Show success toast
        Fluttertoast.showToast(
          msg: "Profile changed successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      } else if (r.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized access. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to change password. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      }

      return r;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
        msg: "Network connection slow or disconnected",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg:
            "Network error: Unable to resolve host. Please check your internet connection.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } catch (error) {
      print('Network error: $error');

      Fluttertoast.showToast(
        msg: "Network error: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    }
  }

  ///todo: 9. get profile emoployee........
  static Future<dynamic> GetEmployeeProfileApi() async {
    try {
      // Retrieve the saved ID from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt("userId");

      if (userId == null) {
        throw Exception("User ID is not saved in SharedPreferences.");
      }

      // Use the dynamic ID in the API URL
      var url = "${baseUrl}api/Employee/GetEmployeeProfile?id=$userId";
      print("API URL profile: $url");

      http.Response response = await http.get(Uri.parse(url));
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        var ProfileModelEmployeeGet =
            profileModelEmployeeGetFromJson(response.body);
        return ProfileModelEmployeeGet;
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (error) {
      print("Error: $error");
      return null;
    }

    ///todo:................................
  }

  /// todo: 10. api for update profile....
  Future<http.Response> updateDriverProfilePic({
    required int id,
    required String driverImage,
    required String driverImageBase64,
  }) async {
    final url = Uri.parse("${baseUrl}api/Driver/UpdateDriverProfilePic");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("userId");
    print("okoakcoas${baseUrl}");
    if (userId == null) {
      throw Exception("User ID is not saved in SharedPreferences.");
    }

    final body = {
      "Id": id,
      "DriverImage": driverImage,
      "DriverImageBase64": driverImageBase64,
    };

    print("okoakcoas${body}");

    final response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(body),
    );

    return response;
  }

  ///todo:11. banner api,.......driver...
  static Future<dynamic> fetchBannersdriver() async {
    try {
      // Retrieve the saved role from GetStorage
      final storage = GetStorage();
      String? role = storage.read("role");

      print("Role for banner: $role");

      // Use the role in the API URL
      var url = "${baseUrl}api/Common/GetBanner?role=$role";
      print("API URL banner: $url");

      http.Response response = await http.get(Uri.parse(url));
      print("Response banner: ${response.body}");

      if (response.statusCode == 200) {
        var BannerDriver = bannerDriverFromJson(response.body);
        return BannerDriver;
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (error) {
      print("Error: $error");
      return null;
    }
  }

  ///todo: 12. create password api,,,,for employee.......
  static Future<http.Response?> CreatePasswordEmployeeApi(
      BuildContext context, // Added context parameter
      // String CurrentPassword,
      String NewPassword,
      String ConfirmPassword) async {
    // Retrieve the saved ID from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("userId");

    if (userId == null) {
      throw Exception("User ID is not saved in SharedPreferences.");
    }

    //employeeId

    var url = "${baseUrl}api/Account/CreateEmployeePassword";
    var body = jsonEncode({
      "Id": "$userId",
      //"OldPassword": CurrentPassword,
      "Password": NewPassword,
      "ConfirmPassword": ConfirmPassword,
    });

    print("loginnnn create");
    print(body);

    try {
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 10));

      print("cresate pass${r.body}");

      if (r.statusCode == 200) {
        print("cresate pass1${r.body}");

        var responseData = json.decode(r.body);
        // var userId = responseData['loginProfile']['id'];

        // Save user ID (assuming 'Id' is part of the response JSON)
        // prefs.write("Id", userId);
        //  print('Saved userId: $userId');

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // Simulate a delay for async operations
        await Future.delayed(Duration(seconds: 1));

        // Clear shared preferences
        // SharedPreferences.getInstance().then((prefs) => prefs.clear());

        // Hide loading dialog
        Get.back();

        // Navigate to Login Page
        ///Get.offAll(() => Login());

        // Show success toast
        Fluttertoast.showToast(
          msg: "Password create password successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      } else if (r.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized access. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to create password. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      }

      return r;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
        msg: "Network connection slow or disconnected",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg:
            "Network error: Unable to resolve host. Please check your internet connection.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } catch (error) {
      print('Network error: $error');

      Fluttertoast.showToast(
        msg: "Network error: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    }
  }

  ///todo 13: edit employee profile api...........
  ///todo: 7. profile update ...driver...
  static Future<http.Response?> updateProfileEmployeeApi(
    BuildContext context,
    String employeeFirstName,
    String employeeMiddleName,
    String employeeLastName,
    String email,
    String mobileNumber,
    String employeeCurrentAddress,
    String stateId,
    String cityId,
    String pincode,
    String EmergencyContactNumber,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("userId");
    if (userId == null) {
      throw Exception("User ID is not saved in SharedPreferences.");
    }

    var url = "${baseUrl}api/Employee/UpdateEmployeeProfile";
    var body = jsonEncode({
      "Id": userId,
      "Employee_First_Name": employeeFirstName,
      "Employee_Middle_Name": employeeMiddleName,
      "Employee_Last_Name": employeeLastName,
      "Email": email,
      "MobileNumber": mobileNumber,
      "EmployeeCurrentAddress": employeeCurrentAddress,
      "StateId": stateId, // Hardcoded state ID for now
      "CityId": cityId,
      "Pincode": pincode,
      "EmergencyContactNumber": EmergencyContactNumber,
    });

    print("Profile update request body: $body");

    try {
      http.Response response = await http.put(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 10));

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // Simulate a delay for async operations
        // await Future.delayed(const Duration(seconds: 1));

        // Clear shared preferences (optional, ensure this behavior is intended)
        //await prefs.clear();

        // Hide loading dialog
        //Get.back();

        // Navigate to Login Page
        // Get.offAll(() => Login());

        // Show success toast
        Fluttertoast.showToast(
          msg: "Profile updated successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      } else if (response.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized access. Status code: ${response.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', response.body);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to update profile. Status code: ${response.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', response.body);
      }

      return response;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
        msg: "Network connection is slow or disconnected.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
      return null;
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg:
            "Network error: Unable to resolve host. Check your internet connection.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
      return null;
    } catch (error) {
      print('Error: $error');

      Fluttertoast.showToast(
        msg: "An unexpected error occurred: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
      return null;
    }
  }

  ///todo 13: state  api.vardaan.............
  /// Fetch States API
  Future<StateModelGet> getStates() async {
    try {
      final url = "${baseUrl}api/Common/GetStates";
      print("Requesting URL: $url");
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        print("API Response: $decodedData"); // Log the response
        return StateModelGet.fromJson(decodedData);
      } else {
        print("API Error: ${response.statusCode} - ${response.body}");
        throw Exception('Failed to load states');
      }
    } catch (e) {
      print("Error fetching states: $e");
      throw Exception('Error fetching states: $e');
    }
  }

  //todo:14 city Fetch Cities by StateId...vardaan.....
  /// Fetch Cities by StateId API
  Future<CityModelGet> getCitiesByStateId(int stateId) async {
    try {
      final response = await http.get(
          Uri.parse('${baseUrl}api/Common/GetCityByStateId?StateId=$stateId'));

      if (response.statusCode == 200) {
        // Parse the JSON into CityModelGet
        return CityModelGet.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load cities');
      }
    } catch (e) {
      throw Exception('Error fetching cities: $e');
    }
  }

  ///todo: 15. help Api.......
  static Future<http.Response?> HelpEmployeeApi(
    BuildContext context, // Added context parameter
    String PhoneNumber,
    String Reason,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("userId");

    if (userId == null) {
      throw Exception("User ID is not saved in SharedPreferences.");
    }

    //employeeId

    var url = "${baseUrl}api/Employee/AddEmployeeHelp";
    var body = jsonEncode({
      "Employee_id": "$userId",
      "PhoneNumber": PhoneNumber,
      "Reason": Reason,
    });

    print("profile dvr update");
    print(body);

    try {
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 10));

      print(r.body);
      print("Response help  before 200: ${r.body}");

      if (r.statusCode == 200) {
        var responseData = json.decode(r.body);
        print("Response help after 200: ${r.body}");

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        await Future.delayed(Duration(seconds: 1));
        //Get.back();
        Get.offAll(() => HomePage());

        // Show success toast
        Fluttertoast.showToast(
          msg: "Submit Help successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      } else if (r.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized access. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to send feedback. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
        Get.snackbar('Error', r.body);
      }
      return r;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
        msg: "Network connection slow or disconnected",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg:
            "Network error: Unable to resolve host. Please check your internet connection.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } catch (error) {
      print('Network error: $error');

      Fluttertoast.showToast(
        msg: "Network error: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    }
  }

  ///todo: 16. feedback Api.......
  static Future<http.Response?> FeedbackEmployeeApi(
    BuildContext context, // Added context parameter
    String Feedback,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("userId");

    if (userId == null) {
      throw Exception("User ID is not saved in SharedPreferences.");
    }

    //employeeId

    var url = "${baseUrl}api/Employee/AddEmployeeFeedback";
    var body = jsonEncode({
      "Employee_id": "$userId",
      "Feedback": Feedback,
    });

    print("feedback update");
    print(body);

    try {
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 10));

      print(r.body);
      print("Response help  before 200: ${r.body}");

      if (r.statusCode == 200) {
        var responseData = json.decode(r.body);
        print("Response help after 200: ${r.body}");

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        await Future.delayed(Duration(seconds: 1));
        //Get.back();
        Get.offAll(() => HomePage());

        // Show success toast
        Fluttertoast.showToast(
          msg: "Submit Feedback successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      } else if (r.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized access. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to send Feedback. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
        Get.snackbar('Error', r.body);
      }
      return r;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
        msg: "Network connection slow or disconnected",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg:
            "Network error: Unable to resolve host. Please check your internet connection.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } catch (error) {
      print('Network error: $error');

      Fluttertoast.showToast(
        msg: "Network error: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    }
  }

  ///todo: 17. get contact us details ........
  static Future<dynamic> GetContactUSApi() async {
    try {
      // https://api.vardaan.ndinfotech.com/api/Common/GetSupport
      // Use the dynamic ID in the API URL
      var url = "${baseUrl}api/Common/GetSupport";
      print("API URL profile: $url");

      http.Response response = await http.get(Uri.parse(url));
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        var GetContactUsModel = getContactUsModelFromJson(response.body);
        return GetContactUsModel;
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (error) {
      print("Error: $error");
      return null;
    }

    ///todo:................................
  }

  ///

  ///

  ///user_ profile__update.........15 jun
  ///

  static String apiUrl7 = "${baseUrl}App/UpdateProfile";
  static Future<http.Response> updateuserProfileApi(
    Map<String, String> formData,
    Uint8List cvFileContent,
    String CVFileName,
    Uint8List cvFileContent2,
    String ProfileImage,
  ) async {
    var uri = Uri.parse(apiUrl7);
    var request = http.MultipartRequest('POST', uri);

    // Add form fields
    formData.forEach((key, value) {
      request.fields[key] = value;
    });

    // Helper function to determine the MediaType based on the file extension
    MediaType getMediaType(String filename) {
      String ext = filename.split('.').last.toLowerCase();
      switch (ext) {
        // case 'jpg':
        // case 'jpeg':
        //   return MediaType('image', 'jpeg');
        // case 'png':
        //   return MediaType('image', 'png');
        case 'pdf':
          return MediaType('application', 'pdf');
        default:
          throw Exception('Unsupported file type');
      }
    }

    MediaType getMediaType2(String filename) {
      String ext = filename.split('.').last.toLowerCase();
      switch (ext) {
        case 'jpg':
        case 'jpeg':
          return MediaType('image', 'jpeg');
        case 'png':
          return MediaType('image', 'png');
        // case 'pdf':
        //   return MediaType('application', 'pdf');
        default:
          throw Exception('Unsupported file type');
      }
    }

    // Add file field
    request.files.add(http.MultipartFile.fromBytes(
        'CVFileName', // The name of the file field
        cvFileContent,
        filename: CVFileName,
        // Use the file name from the parameter
        contentType: getMediaType(CVFileName)

        //contentType:
        //MediaType('application', 'pdf'), // Use MediaType from http_parser
        ));

    request.files.add(http.MultipartFile.fromBytes(
        'ProfileImage', // The name of the file field
        cvFileContent2,
        filename: ProfileImage,
        // Use the file name from the parameter
        contentType: getMediaType2(ProfileImage)

        //contentType:
        //MediaType('application', 'pdf'), // Use MediaType from http_parser
        ));

    // Get token from GetStorage
    // final storage = GetStorage();
    // var token = storage.read('token');

    // Set token in headers
    //request.headers['Authorization'] = 'Bearer $token';

    // Send the request
    var response = await request.send();

    // Parse the response
    var httpResponse = await http.Response.fromStream(response);

    // Print the response data
    print('Response status: ${httpResponse.statusCode}');
    print('Response body: ${httpResponse.body}');

    if (httpResponse.statusCode == 200) {
      // Show success toast
      Fluttertoast.showToast(
        msg: "Profile Updated successfully!",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    } else {
      // Show error toast
      Fluttertoast.showToast(
        msg:
            "Failed to Update Profile. Status code: ${httpResponse.statusCode}",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }

    return httpResponse;
  }

  ///change password api,,,,for user.......
  static Future<http.Response?> ChangePasswordApi(
      BuildContext context, // Added context parameter
      String CurrentPassword,
      String NewPassword,
      String ConfirmPassword) async {
    var prefs = GetStorage();

    // Read saved userId
    String userId = prefs.read("Id").toString();
    print('wwwuseridEE:$userId');

    var url = "${baseUrl}App/UserChangePassword";
    var body = jsonEncode({
      "currentPassword": CurrentPassword,
      "newPassword": NewPassword,
      "confirmPassword": ConfirmPassword,
      "userId": userId
    });

    print("loginnnn");
    print(body);

    try {
      http.Response r = await http.post(
        Uri.parse(url),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 10));

      print(r.body);

      if (r.statusCode == 200) {
        var responseData = json.decode(r.body);
        // var userId = responseData['loginProfile']['id'];

        // Save user ID (assuming 'Id' is part of the response JSON)
        // prefs.write("Id", userId);
        //  print('Saved userId: $userId');

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        // Simulate a delay for async operations
        await Future.delayed(Duration(seconds: 1));

        // Clear shared preferences
        SharedPreferences.getInstance().then((prefs) => prefs.clear());

        // Hide loading dialog
        Get.back();

        // Navigate to Login Page
        ///Get.offAll(() => Login());

        // Show success toast
        Fluttertoast.showToast(
          msg: "Password changed successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      } else if (r.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized access. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      } else {
        Fluttertoast.showToast(
          msg: "Failed to change password. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );

        Get.snackbar('Error', r.body);
      }

      return r;
    } on TimeoutException catch (_) {
      Fluttertoast.showToast(
        msg: "Network connection slow or disconnected",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } on SocketException catch (_) {
      Fluttertoast.showToast(
        msg:
            "Network error: Unable to resolve host. Please check your internet connection.",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    } catch (error) {
      print('Network error: $error');

      Fluttertoast.showToast(
        msg: "Network error: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    }
  }

  ///todo: booking request trip type api...
  static Future<GetTripTypeModel?> getTripType() async {
    var getTripType =
        'https://api.vardaan.ndinfotech.com/api/Common/GetTripTypes';
    try {
      print("getTripType:${getTripType}");
      http.Response response = await http.get(Uri.parse(getTripType));
      if (response.statusCode == 200) {
        print("getTripType:200");
        GetTripTypeModel aboutCompanyModel =
            getTripTypeModelFromJson(response.body);
        // var jsonResponse = jsonDecode(response.body);
        // if (jsonResponse['data'] != null) {
        //   print("comUrl:${jsonResponse['data']}");
        //   return aboutCompanyModel;
        // }
        print("getTripType:${aboutCompanyModel.data}");
        return aboutCompanyModel;
      }
      // return null;
    } catch (error) {
      print('Error fetching FAQ: $error');
      // return [];
    }
    return null;
  }

  ///todo: get shift type api...
  static Future<GetShiftTypeModel?> getShiftType() async {
    var getShiftType =
        'https://api.vardaan.ndinfotech.com/api/Common/GetShiftType';
    try {
      print("getShiftType:${getShiftType}");
      http.Response response = await http.get(Uri.parse(getShiftType));
      if (response.statusCode == 200) {
        print("getShiftType:200");
        GetShiftTypeModel getShiftTypeModel =
            getShiftTypeModelFromJson(response.body);
        // var jsonResponse = jsonDecode(response.body);
        // if (jsonResponse['data'] != null) {
        //   print("comUrl:${jsonResponse['data']}");
        //   return aboutCompanyModel;
        // }
        print("getTripType:${getShiftTypeModel.data}");
        return getShiftTypeModel;
      }
      // return null;
    } catch (error) {
      print('Error fetching FAQ: $error');
      // return [];
    }
    return null;
  }

  ///todo: pickup shift api...
  static Future<GetPickupShiftTimeModel?> getPickupShiftTime() async {
    var getPickupShiftTime =
        'https://api.vardaan.ndinfotech.com/api/Common/GetPickupShiftTime';
    try {
      print("getPickupShiftTime:${getPickupShiftTime}");
      http.Response response = await http.get(Uri.parse(getPickupShiftTime));
      if (response.statusCode == 200) {
        print("getPickupShiftTime:200");
        GetPickupShiftTimeModel getPickupShiftTimeModel =
            getPickupShiftTimeModelFromJson(response.body);
        // var jsonResponse = jsonDecode(response.body);
        // if (jsonResponse['data'] != null) {
        //   print("comUrl:${jsonResponse['data']}");
        //   return aboutCompanyModel;
        // }
        print("getPickupShiftTime:${getPickupShiftTimeModel.data}");
        return getPickupShiftTimeModel;
      }
      // return null;
    } catch (error) {
      print('Error fetching FAQ: $error');
      // return [];
    }
    return null;
  }

  /// todo: drop shift api...
  static Future<GetDropShiftTimeModel?> getDropShiftTime() async {
    var getDropShiftTime =
        'https://api.vardaan.ndinfotech.com/api/Common/GetDropShiftTime';
    try {
      print("getDropShiftTime:${getDropShiftTime}");
      http.Response response = await http.get(Uri.parse(getDropShiftTime));
      if (response.statusCode == 200) {
        print("getDropShiftTime:200");
        GetDropShiftTimeModel getDropShiftTimeModel =
            getDropShiftTimeModelFromJson(response.body);
        // var jsonResponse = jsonDecode(response.body);
        // if (jsonResponse['data'] != null) {
        //   print("comUrl:${jsonResponse['data']}");
        //   return aboutCompanyModel;
        // }
        print("getDropShiftTime:${getDropShiftTimeModel.data}");
        return getDropShiftTimeModel;
      }
      // return null;
    } catch (error) {
      print('Error fetching FAQ: $error');
      // return [];
    }
    return null;
  }

  ///todo: booking post booking request.....
  static Future<http.Response?> bookTrip(
      String empId,
      String compId,
      int shiftType,
      int tripType,
      String startDate,
      String endDate,
      int pickupTimeId,
      int dropTimeId) async {
    var bookTripUrl =
        'https://api.vardaan.ndinfotech.com/api/Booking/CreateRequest';
    var body = jsonEncode({
      "EmployeeId": "${empId}",
      "CompanyId": "${compId}",
      "ShiftType": "${shiftType}",
      "TripType": "${tripType}",
      "StartRequestDate": "${startDate}",
      "EndRequestDate": "${endDate}",
      "PickupShiftTimeId": "${pickupTimeId}",
      "DropShiftTimeId": "${dropTimeId}"
    });
    try {
      http.Response r = await http.post(
        Uri.parse(bookTripUrl),
        body: body,
        headers: {
          "Content-Type": "application/json",
        },
      );
      print("shiftType :$empId");
      print("shiftType :$compId");
      print("shiftType :$shiftType");
      print("tripType :$tripType");
      print("startDate :$startDate");
      print("endDate :$endDate");
      print("pickupTimeId :$pickupTimeId");
      print("dropTimeId :$dropTimeId");

      print(r.body);
      if (r.statusCode == 200) {
        print("booktrip Body 200:${r.body}");
        print("booktrip :${r.statusCode}");
        var responseData = json.decode(r.body);

        // Show loader
        Get.dialog(
          Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
        );

        // Wait for 2 seconds
        await Future.delayed(Duration(seconds: 2));

        // Close loader
        Get.back();

        // Navigate to HomePage
        Get.to(HomePage());
        // await Future.delayed(Duration(seconds: 1));
        //
        // Get.to(HomePage());

        // Show success toast
        Fluttertoast.showToast(
          msg: "Your Request Sent Successfully!",
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
        );
      } else if (r.statusCode == 401) {
        Fluttertoast.showToast(
          msg: "Unauthorized access. Status code: ${r.statusCode}",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
        print('booktrip elseeeIf');

        Get.snackbar('Error', r.body);
      } else {
        print('booktrip elseee');
        // Get.snackbar('Error', r.body);
      }
      return r;
    } catch (error) {
      print('Network error: $error');

      Fluttertoast.showToast(
        msg: "Network error: $error",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      return null;
    }
  }
}
