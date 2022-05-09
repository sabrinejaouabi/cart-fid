// To parse this JSON data, do
//
//     final enduser = enduserFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

Enduser enduserFromJson(String str) => Enduser.fromJson(json.decode(str));

String enduserToJson(Enduser data) => json.encode(data.toJson());

class Enduser {
  Enduser({
    this.username,
    this.fullname,
    this.email,
    this.phone,
   this.uid,
  });

  String? uid;
  String ?username;
  String ?fullname;
  String? email;
  String ?phone;

  factory Enduser.fromJson(Map<String, dynamic> json) => Enduser(
    uid: json["uid"],
    username: json["username"],
    fullname: json["fullname"],
    email: json["email"],
    phone: json["phone"],
  );
  Map<String, dynamic> toJsonUpdate() => {
    "username": username,
    "phone": phone,
  };

  Map<String, dynamic> toJson() => {
    "uid":uid,
    "username": username,
    "fullname": fullname,
    "email": email,
    "phone": phone,
  };
}
