import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:reminder_app/BaseResponse.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  String userName;
  String password;
  String profileImage;

  LoginResponse({
    this.userName,
    this.password,
    this.profileImage,
  });

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        userName: json["userName"],
        password: json["password"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toMap() => {
        "userName": userName,
        "password": password,
        "profileImage": profileImage,
      };
}
