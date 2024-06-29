import 'dart:convert';

import 'package:advisor_graduation_project/model/advisorModel.dart';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? message;
  Advisor? advisor;
  String? token;
  String? email;
  String? password;

  LoginModel({
    this.message,
    this.advisor,
    this.token,
    this.email,
    this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    message: json["message"],
    advisor: Advisor.fromJson(json["advisor"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "email" : email,
    "password" : password,
  };
}
