// //import 'package:ps_welness_new_ui/utils/models/account_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../models/login_model.dart';
// //import '../models/login_model.dart';  // Your model
//
// class AccountService {
//   static const String _accountKey = 'accountData';
//
//   Future<void> setAccountData(Message accountData) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(
//         _accountKey, messageToJson(accountData)); // Save encoded data
//   }
//
//   Future<Message?> get getAccountData async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final String? accountDataEncoded = prefs.getString(_accountKey);
//     if (accountDataEncoded != null) {
//       return messageFromJson(accountDataEncoded); // Decode to Message object
//     }
//     return null; // If no data found
//   }
// }
//
// final accountService = AccountService();
