// To parse this JSON data, do
//
//     final message = messageFromJson(jsonString);

import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  int? status;
  String? message;
  Model? model;
  String? token;

  Message({
    this.status,
    this.message,
    this.model,
    this.token,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        status: json["status"],
        message: json["message"],
        model: json["model"] == null ? null : Model.fromJson(json["model"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "model": model?.toJson(),
        "token": token,
      };
}

class Model {
  String? id;
  String? username;
  String? password;

  Model({
    this.id,
    this.username,
    this.password,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["id"],
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
      };
}
