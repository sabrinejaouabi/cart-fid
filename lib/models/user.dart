import 'dart:convert';

class User {
  String? id;
  String? fname;
  String? lname;
  String? email;
  String? phone;
  String? password;
  String? bdate;
  String? facebookId;
  String? googleId;

  User(
      {this.id,
        this.fname,
        this.lname,
        this.email,
        this.phone,
        this.password,
        this.bdate,
        this.facebookId,
        this.googleId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['name'];
    lname = json['prenom'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    bdate = json['bdate'];
    facebookId = json['facebookId'];
    googleId = json['googleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.fname;
    data['prenom'] = this.lname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['bdate'] = this.bdate;
    data['facebookId'] = this.facebookId;
    data['googleId'] = this.googleId;
    return data;
  }

  String serialize (User u) {
    var map = {
      "id" : u.id,
      "name" : u.fname,
      "prenom" : u.lname,
      "email":u.email,
      "phone":u.phone,
      "bdate":u.bdate,
      "facebookId":u.facebookId,
      "googleId":u.googleId,
    };
    return json.encode(map);
  }

}
