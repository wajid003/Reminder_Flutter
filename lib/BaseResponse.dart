
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponse {

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'message')
  String message;

  BaseResponse({this.status, this.message});

  factory BaseResponse.fromJson(String str) => BaseResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BaseResponse.fromMap(Map<String, dynamic> json) => BaseResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
  };

}